require 'rspec'
require './lib/node'

describe Node do

  describe '#initialize' do
    it 'exists' do
      node = Node.new('plop')
      
      expect(node).to be_a Node
    end

    it 'has data' do
      node = Node.new('plop')

      expect(node.data).to eq('plop')
    end

    it 'has a next node that is nil by default' do
      node = Node.new('plop')

      expect(node.next_node).to eq(nil)
    end
  end
end
