module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Person < Animal
  include Walkable

  private

  def gait
    "strolls"
  end
end


class Cat < Animal
  include Walkable

  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  include Walkable
  
  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"