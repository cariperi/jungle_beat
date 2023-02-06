class JungleBeat
  attr_reader :list

  def initialize(data = '')
    @list = LinkedList.new
    @valid_beats = ['tee', 'dee', 'deep', 'bop', 'boop',
    'la', 'na', 'doo', 'ditt', 'woo', 'hoo',
    'shu', 'mi', 'ray']
    self.append(data)
  end

  def append(data)
    beats_added = 0
    data.split(" ").each do |data_string|
      if @valid_beats.include?(data_string)
        @list.append(data_string)
        beats_added += 1
      end
    end
    beats_added
  end

  def prepend(data)
    beats_added = 0
    data.split(" ").reverse.each do |data_string|
      if @valid_beats.include?(data_string)
        @list.prepend(data_string)
        beats_added += 1
      end
    end
    beats_added
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Boing #{@list.to_string}`
  end

  def all
    @list.to_string
  end
end
