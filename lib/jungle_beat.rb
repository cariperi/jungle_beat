class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(data = '')
    @list = LinkedList.new
    @rate = 500
    @voice = 'Boing'
    @valid_beats = ['tee', 'dee', 'deep', 'bop', 'boop',
    'la', 'na', 'doo', 'ditt', 'woo', 'hoo',
    'shu', 'mi', 'ray', 'dop']
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
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    @list.count
  end

  def all
    @list.to_string
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Boing'
  end
end
