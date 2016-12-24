module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_accessor :name

  @@number_of_cats = 0
  COLOR = "purple".freeze

  def initialize(name)
    @name = name
    @@number_of_cats +=1
  end

  def self.total
    p @@number_of_cats
  end

  def greet
    puts "Hello, my name is #{name}, and I'm a #{COLOR} cat!"
  end

  def personal_greeting
    puts "Hello, my name is #{name}"
  end

  def self.generic_greeting
    puts "Hello I'm a cat!"
  end

  def rename(new_name)
    self.name = new_name
  end

  def identify
    self
  end

  def to_s
    "I'm #{name}"
  end
end

class Person
  attr_writer :secret

  def share_secret
    secret
  end

  def compare_secret(other_person)
    self.secret == other_person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

p person1.compare_secret(person2)
