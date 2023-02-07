class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    current_node = @head
    if current_node.nil?
      @head = Node.new(data)
    else
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
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
    formatted_string = ''
    until current_node.nil?
      formatted_string = formatted_string + current_node.data + ' '
      current_node = current_node.next_node
    end
    formatted_string.strip
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

  def insert(position, data)
    current_node = @head
    if current_node.nil?
      @head = Node.new(data)
    else
      (position-1).times { current_node = current_node.next_node } 
      new_node = Node.new(data)
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
    data
  end

  def find(position, num_elements)
    current_node = @head
    found_elements = ''
    position.times { current_node = current_node.next_node }
    num_elements.times do
      found_elements = found_elements + current_node.data + ' '
      current_node = current_node.next_node
    end
    found_elements.strip
  end

  def includes?(data)
    to_string.include?(data) ? true : false
  end

  def pop
    current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    removed_data = current_node.next_node.data
    current_node.next_node = nil
    removed_data
  end
end
