class LinkedList
  attr_reader :head, :count

  def initialize
    @head = nil
  end

  def append(data)
    current_node = @head
    if current_node.nil?
      @head = Node.new(data)
    else
      while current_node.next_node != nil do
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end    
    data
  end

  def prepend(data)
    current_node = @head    
    if current_node.nil?
      @head = Node.new(data)
    else
      new_node = Node.new(data)
      new_node.next_node = current_node
      @head = new_node
    end
    data
  end

  def count    
    counter = 0
    current_node = @head
    until current_node.nil?
      counter +=1
      current_node = current_node.next_node
    end
    counter
  end

  def to_string
    current_node = @head
    data_strings = []
    until current_node.nil?
      data_strings << current_node.data
      current_node = current_node.next_node
    end
    data_strings.join(" ")
  end
end
