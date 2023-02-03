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
end
