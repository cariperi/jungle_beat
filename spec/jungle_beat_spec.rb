require 'rspec'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

describe JungleBeat do
  describe '#initialize' do
    before(:each) do
      @jb = JungleBeat.new
    end

    it 'exists' do
      expect(@jb).to be_a JungleBeat
    end

    it 'has an empty LinkedList object' do
      expect(@jb.list).to be_a LinkedList
      expect(@jb.list.head).to eq(nil)
    end

    it 'has a default voice' do
      expect(@jb.voice).to eq('Boing')
    end

    it 'has a default rate' do
      expect(@jb.rate).to eq(500)
    end
  end

  describe '#append' do
    it 'adds seperate nodes to the end of the string' do
      jb = JungleBeat.new
      jb.append('deep doo ditt')
      jb.append('woo hoo shu')

      expect(jb.list.head.data).to eq('deep')
      expect(jb.list.head.next_node.data).to eq('doo')
      expect(jb.list.to_string).to eq('deep doo ditt woo hoo shu')
    end

    it 'returns the number of beats successfully inserted' do
      jb = JungleBeat.new

      expect(jb.append('deep doo ditt')).to eq(3)
      expect(jb.append('deep doo ditt mississippi')).to eq(3)
    end

    it 'does nothing if the argument string is empty' do
      jb = JungleBeat.new
      jb.append('')

      expect(jb.list.head).to eq(nil)
    end

    it 'rejects invalid beats' do
      jb = JungleBeat.new('deep')

      expect(jb.append('mississippi')).to eq(0)
      expect(jb.count).to eq(1)
    end
  end

  describe '#prepend' do
    it 'adds seperate nodes to the beginning of the string' do
      jb = JungleBeat.new
      jb.append('deep doo ditt')
      jb.prepend('woo hoo shu')

      expect(jb.list.head.data).to eq('woo')
      expect(jb.list.head.next_node.data).to eq('hoo')
      expect(jb.list.to_string).to eq('woo hoo shu deep doo ditt')
    end

    it 'returns the number of beats successfully inserted' do
      jb = JungleBeat.new

      expect(jb.prepend('deep doo ditt')).to eq(3)
      expect(jb.prepend('deep doo ditt mississippi')).to eq(3)
    end

    it 'does nothing if the argument string is empty' do
      jb = JungleBeat.new
      jb.prepend('')

      expect(jb.list.head).to eq(nil)
    end

    it 'rejects invalid beats' do
      jb = JungleBeat.new('deep')

      expect(jb.prepend('mississippi')).to eq(0)
      expect(jb.count).to eq(1)
    end
  end

  describe '#count' do
    before(:each) do
      @jb = JungleBeat.new
    end

    it 'returns 0 if the list is empty' do
      expect(@jb.count).to eq(0)
    end

    it 'returns the number of nodes in the list' do
      @jb.append('deep doo ditt woo hoo shu')

      expect(@jb.count).to eq(6)
    end
  end

  describe '#play' do
    it 'generates a JungleBeat string and returns number of beats' do
      jb = JungleBeat.new
      jb.append('deep doo ditt woo hoo shu')

      expect(jb.play).to eq(6)
    end

    it 'returns an error message if the JungleBeat has no beats' do
      jb = JungleBeat.new

      expect(jb.play).to eq('Sorry, this JungleBeat has no beats!')
    end
  end

  describe '#all' do
    it 'returns a formatted string of all beats' do
      jb = JungleBeat.new
      jb.append('deep doo ditt woo hoo shu')

      expect(jb.all).to eq('deep doo ditt woo hoo shu')
    end
  end

  describe '#voice=' do
    it 'changes the voice if chosen voice is valid' do
      jb = JungleBeat.new
      jb.voice=('Daniel')

      expect(jb.voice).to eq('Daniel')
    end

    it 'keeps voice as-is if chosen voice is invalid' do
      jb = JungleBeat.new
      jb.voice=('Caroline')

      expect(jb.voice).to eq('Boing')
    end
  end

  describe '#reset_rate' do
    it 'resets the rate to 500' do
      jb = JungleBeat.new
      jb.rate = 100
      jb.reset_rate

      expect(jb.rate).to eq(500)
    end
  end

  describe '#reset_voice' do
    it 'resets to voice to Boing' do
      jb = JungleBeat.new
      jb.voice = 'Daniel'
      jb.reset_voice

      expect(jb.voice).to eq('Boing')
    end
  end
end
