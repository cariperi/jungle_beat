class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
    data
  end

  def count    
    counter = 0
    current_node = @head
    until current_node == nil
      counter +=1
      current_node = current_node.next_node
    end
    counter
  end
end
