class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen(&block)
    record yield(block) if block_given?
  end

  def play
    recordings.each { |recording| puts recording }
  end

  private
  attr_reader :recordings
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
