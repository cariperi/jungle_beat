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
end
