class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    data.split(" ").each do |data_string|
      @list.append(data_string)
    end
    data
  end

  def count
    @list.count
  end
end
