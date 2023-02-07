require 'rspec'
require './lib/node'
require './lib/linked_list'

describe LinkedList do
  before(:each) do
    @list = LinkedList.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@list).to be_a LinkedList
    end

    it 'has a head that is nil by default' do
      expect(@list.head).to eq(nil)
    end
  end

  describe '#append' do
    it 'adds data to the list' do
      @list.append('doop')

      expect(@list.head).not_to eq(nil)
    end

    it 'inserts a new node with specified data as the head, if list is empty' do
      @list.append('doop')

      expect(@list.head).to be_a Node
      expect(@list.head.data).to eq('doop')
    end

    it 'inserts a new node with specified data at the end of the list' do
      @list.append('doop')
      @list.append('deep')
      @list.append('plop')

      expect(@list.head.data).to eq('doop')
      expect(@list.head.next_node).to be_a Node
      expect(@list.head.next_node.data).to eq('deep')
      expect(@list.head.next_node.next_node.data).to eq('plop')
    end

    it 'returns the data that was added to the list' do
      expect(@list.append('doop')).to eq('doop')
    end
  end

  describe '#count' do
    it 'returns 0 if the list is empty' do
      expect(@list.count).to eq(0)
    end

    it 'returns the number of nodes in the list' do
      @list.append('doop')
      @list.append('deep')
      @list.append('plop')

      expect(@list.count).to eq(3)
    end
  end

  describe '#to_string' do
    it 'returns a formatted string of all data elements' do
      @list.append('doop')
      @list.append('deep')
      @list.append('plop')

      expect(@list.to_string).to be_a String
      expect(@list.to_string).to eq('doop deep plop')
    end
  end

  describe '#prepend' do
    it 'inserts a new node with specified data as the head, if the list is empty' do
      @list.prepend('dop')

      expect(@list.head.data).to eq('dop')
    end

    it 'adds a new node with specified data before existing nodes' do
      @list.append('plop')
      @list.append('suu')
      @list.prepend('dop')
      @list.append('womp')
      @list.prepend('ape')

      expect(@list.to_string).to eq('ape dop plop suu womp')
      expect(@list.head.data).to eq('ape')
      expect(@list.head.next_node.data).to eq('dop')
    end

    it 'returns the data that was added to the list' do
      @list.prepend('dop')

      expect(@list.prepend('dop')).to eq('dop')
    end
  end

  describe '#insert' do
    it 'inserts a new node with specified data as the head, if the list is empty' do
      @list.insert(1, 'woo')

      expect(@list.head.data).to eq('woo')
    end

    it 'adds a new node at a specific position' do
      @list.append('plop')
      @list.append('suu')
      @list.prepend('dop')
      @list.insert(1, 'woo')

      expect(@list.to_string).to eq('dop woo plop suu')
      expect(@list.count).to eq(4)
      expect(@list.head.next_node.data).to eq('woo')
      expect(@list.head.next_node.next_node.data).to eq('plop')
    end

    it 'returns the data that was added to the list' do
      @list.append('plop')
      @list.append('suu')
      @list.prepend('dop')
      @list.insert(1, 'woo')

      expect(@list.insert(1, 'woo')).to eq('woo')
    end

    it 'returns an error and does not add node if the position does not exist in the list' do
      @list.append('plop')
      @list.append('suu')
      @list.append('woo')

      expect(@list.insert(4, 'dop')).to eq('Sorry! This action cannot be completed.')
      expect(@list.count).to eq(3)
    end
  end

  describe '#find' do
    before(:each) do
      @list.append('woo')
      @list.append('shi')
      @list.append('shu')
      @list.prepend('deep')
      @list.append('blop')
    end

    it 'returns an element from a specific position as a string' do
      expect(@list.find(2, 1)).to eq('shi')
    end

    it 'returns more than one element if given an argument > 1' do
      expect(@list.find(1, 3)).to eq('woo shi shu')
    end
  end

  describe '#includes?' do
    before(:each) do
      @list.append('woo')
      @list.append('shi')
      @list.append('shu')
      @list.prepend('deep')
      @list.append('blop')
    end

    it 'returns true if the given argument is in the list' do
      expect(@list.includes?('deep')).to be true
    end

    it 'returns false if the given argument is not in the list' do
      expect(@list.includes?('dep')).to be false
    end
  end

  describe '#pop' do
    before(:each) do
      @list.append('woo')
      @list.append('shi')
      @list.append('shu')
      @list.prepend('deep')
      @list.append('blop')
    end

    it 'removes the last element from the list' do
      2.times { @list.pop }

      expect(@list.to_string).to eq('deep woo shi')
    end

    it 'returns the last element from the list' do
      expect(@list.pop).to eq('blop')
    end
  end
end
