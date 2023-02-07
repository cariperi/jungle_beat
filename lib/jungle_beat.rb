class JungleBeat
  attr_reader :list, :voice
  attr_accessor :rate

  @@valid_beats = %w[tee dee deep bop boop la na doo ditt woo hoo
                     shu mi ray dop]
  @@valid_voices = %w[Daniel Boing Kathy Fred Ralph Albert Cellos]
  @@default_voice = 'Boing'
  @@default_rate = 500

  def initialize(data = '')
    @list = LinkedList.new
    @voice = @@default_voice
    @rate = @@default_rate
    append(data)
  end

  def append(data)
    beats_added = 0
    data.split(' ').each do |data_string|
      if valid_beat?(data_string)
        @list.append(data_string)
        beats_added += 1
      end
    end
    beats_added
  end

  def prepend(data)
    beats_added = 0
    data.split(' ').reverse.each do |data_string|
      if valid_beat?(data_string)
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
    return 'Sorry, this JungleBeat has no beats!' if @list.count == 0
    `say -r #{@rate} -v #{@voice} #{@list.to_string}`
    @list.count
  end

  def all
    @list.to_string
  end

  def voice=(voice)
    return unless @@valid_voices.include?(voice)
    @voice = voice
  end

  def reset_rate
    @rate = @@default_rate
  end

  def reset_voice
    @voice = @@default_voice
  end

  def valid_beat?(beat)
    @@valid_beats.include?(beat)
  end
end
