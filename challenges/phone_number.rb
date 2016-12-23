require 'Pry'
class PhoneNumber
  attr_reader :phone_number

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return '0000000000' if incorrect_format
    process(phone_number)
  end

  def area_code
    self.number.slice(0..2)
  end

  def to_s
    num = self.number
    "(#{self.area_code}) #{num.slice(3..5)}-#{num.slice(6..10)}"
  end

  private

  def incorrect_format
    num = phone_number.gsub(/\D/, '')
    num.size < 10 || num.size > 11 || 
    num.size == 11 && num[0] != '1' ||
    phone_number.match(/[a-zA-Z]/)

  end

  def process(num)
    if num[0] == "1" && num.size == 11
      num.gsub(/\D/, '').slice(1..-1)
    else
      num.gsub(/\D/, '')
    end 
  end
end