require 'rspec'
require './lib/node'
require './lib/linked_list'

describe LinkedList do
  describe '#initialize' do
    it 'exists' do
      list = LinkedList.new

      expect(list).to be_a LinkedList
    end

    it 'has a head that is nil by default' do
      list = LinkedList.new

      expect(list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'adds data to the list' do
      list = LinkedList.new
      list.append('doop')

      expect(list.head).not_to eq(nil)
    end

    it 'creates a new node and assigns it to the head' do
      list = LinkedList.new
      list.append('doop')

      expect(list.head).to be_a Node
      expect(list.head.data).to eq('doop')
    end

    it 'returns the data that was added to the list' do
      list = LinkedList.new

      expect(list.append('doop')).to eq('doop')
    end
  end

  describe '#count' do
    it 'returns 0 if the list is empty' do
      list = LinkedList.new

      expect(list.count).to eq(0)
    end

    it 'returns the number of nodes in the list' do
      list = LinkedList.new
      list.append('doop')

      expect(list.count).to eq(1)
    end
  end

  describe '#to_string' do
    it 'returns a string of all data elements' do
      list = LinkedList.new
      list.append('doop')

      expect(list.to_string).to be_a String
      expect(list.to_string).to eq('doop')
    end
  end
end
require 'pry'; binding.pry