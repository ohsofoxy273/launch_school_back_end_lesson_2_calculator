class Greeting

  def greet(string)
    puts string
  end
end

class Hello < Greeting

  def hi 
    greet "Hello"
  end
end

class Goodbye < Greeting

  def bye
    greet "Goodbye"
  end

end

class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    donut_type = filling_type ? filling_type : 'Plain'
    glaze = glazing ? " with #{glazing}" : ''
    "#{donut_type}#{glaze}"
  end
end


