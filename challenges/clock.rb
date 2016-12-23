require 'Pry'

class Clock

  def self.at(hour=0, minute=0)
    new(hour, minute)
  end

  def to_s
    combine_hour_and_minutes
  end
  
  def +(number)
    Clock.new(hour, minute + number)
  end

  def -(number)
    Clock.new(hour, minute - number)
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end

  private

  MINS_PER_HOUR = 60
  HOURS_PER_DAY = 24

  attr_reader :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
    convert_to_twenty_four_hour
  end

  def convert_to_string(digit)
    if digit < 10
      "0#{digit}" 
    else
      "#{digit}"
    end
  end

  def combine_hour_and_minutes
    convert_to_string(hour) + ":" + convert_to_string(minute)
  end

  def convert_to_twenty_four_hour
    total_minutes = MINS_PER_HOUR * hour + minute
    @hour = total_minutes / MINS_PER_HOUR % HOURS_PER_DAY
    @minute = total_minutes % MINS_PER_HOUR
  end

end