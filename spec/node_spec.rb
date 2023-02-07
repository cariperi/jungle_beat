require 'rspec'
require './lib/node'

describe Node do
  before(:each) do
    @node = Node.new('plop')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@node).to be_a Node
    end

    it 'has data' do
      expect(@node.data).to eq('plop')
    end

    it 'has a next node that is nil by default' do
      expect(@node.next_node).to eq(nil)
    end
  end
end
