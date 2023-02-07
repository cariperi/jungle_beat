class JungleBeat
  attr_reader :list, :voice
  attr_accessor :rate

  @@valid_beats = %w[tee dee deep bop boop la na doo ditt woo hoo shu mi ray dop]
  @@valid_voices = %w[Daniel Boing Kathy Fred Ralph Albert Cellos]
  @@default_voice = 'Boing'
  @@default_rate = 500

  def initialize(data = '')
    @list = LinkedList.new
    @rate = @@default_rate
    @voice = @@default_voice
    append(data)
  end

  def append(data)
    beats_added = 0
    data.split(' ').each do |data_string|
      if @@valid_beats.include?(data_string)
        @list.append(data_string)
        beats_added += 1
      end
    end
    beats_added
  end

  def prepend(data)
    beats_added = 0
    data.split(' ').reverse.each do |data_string|
      if @@valid_beats.include?(data_string)
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

  def voice=(voice)
    if @@valid_voices.include?(voice)
      @voice = voice
    else
      puts 'Sorry! This voice is not valid.'
    end
  end

  def reset_rate
    @rate = @@default_rate
  end

  def reset_voice
    @voice = @@default_voice
  end
end
