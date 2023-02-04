require 'rspec'
require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'

describe JungleBeat do
  describe '#initialize' do
    it 'exists' do
      jb = JungleBeat.new

      expect(jb).to be_a JungleBeat
    end

    it 'has an empty LinkedList object' do
      jb = JungleBeat.new

      expect(jb.list).to be_a LinkedList
      expect(jb.list.head).to eq(nil)
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

    it 'returns the original data as a single string' do
      jb = JungleBeat.new

      expect(jb.append('deep doo ditt')).to eq('deep doo ditt')
    end

    it 'does nothing if the argument string is empty' do
      jb = JungleBeat.new
      jb.append('')

      expect(jb.list.head).to eq(nil)
    end
  end
end
