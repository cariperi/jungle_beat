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

    it 'inserts a new node as the head if list is empty' do
      list = LinkedList.new
      list.append('doop')

      expect(list.head).to be_a Node
      expect(list.head.data).to eq('doop')
    end

    it 'inserts a new node at the end of the list if list is not empty' do
      list = LinkedList.new
      list.append('doop')
      list.append('deep')
      list.append('plop')

      expect(list.head.data).to eq('doop')
      expect(list.head.next_node).to be_a Node
      expect(list.head.next_node.data).to eq('deep')
      expect(list.head.next_node.next_node.data).to eq('plop')
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
      list.append('deep')
      list.append('plop')

      expect(list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'returns a formatted string of all data elements' do
      list = LinkedList.new
      list.append('doop')
      list.append('deep')
      list.append('plop')

      expect(list.to_string).to be_a String
      expect(list.to_string).to eq('doop deep plop')
    end
  end

  describe '#prepend' do
    it 'inserts a new node as the head if the list is empty' do
      list = LinkedList.new
      list.prepend('dop')

      expect(list.head.data).to eq('dop')
    end

    it 'adds a new node before existing nodes' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.append('womp')
      list.prepend('ape')

      expect(list.to_string).to eq('ape dop plop suu womp')
      expect(list.head.data).to eq('ape')
      expect(list.head.next_node.data).to eq('dop')
    end

    it 'returns the data that was added to the list' do
      list = LinkedList.new
      list.prepend('dop')

      expect(list.prepend('dop')).to eq('dop')
    end
  end

  describe '#insert' do
    it 'inserts a new node as the head if the list is empty' do
      list = LinkedList.new
      list.insert(1, 'woo')

      expect(list.head.data).to eq('woo')
    end

    it 'adds a new element at a specific position' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(1, 'woo')

      expect(list.to_string).to eq('dop woo plop suu')
      expect(list.count).to eq(4)
      expect(list.head.next_node.data).to eq('woo')
      expect(list.head.next_node.next_node.data).to eq('plop')
    end

    it 'returns the data that was added to the list' do
      list = LinkedList.new
      list.append('plop')
      list.append('suu')
      list.prepend('dop')
      list.insert(1, 'woo')

      expect(list.insert(1, 'woo')).to eq('woo')
    end
  end

  describe '#find' do
    it 'returns an element from a specific position as a string' do
      list = LinkedList.new
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.prepend('deep')
      list.append('blop')

      expect(list.find(2, 1)).to eq('shi')
    end

    it 'returns more than one element if given an argument > 1' do 
      list = LinkedList.new
      list.append('woo')
      list.append('shi')
      list.append('shu')
      list.prepend('deep')
      list.append('blop')

      expect(list.find(1, 3)).to eq('woo shi shu')
    end
  end
end
