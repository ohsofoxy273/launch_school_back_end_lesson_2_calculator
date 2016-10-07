def longer_string(string_1, string_2)
  string_1.size > string_2.size ? string_1 : string_2
end

def shorter_string(string_1, string_2)
  string_1.size > string_2.size ? string_2 : string_1
end

def short_long_short(string_1, string_2)
  long = longer_string(string_1, string_2)
  short = shorter_string(string_1, string_2)
  short + long + short
end

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

def short_long_short(string_1, string_2)
  (string_1.size > string_2.size) ? (string_2 + string_1 + string_2) : (string_1 + string_2 + string_1)
end

#  ends with st, nd, rd, or th as appropriate for that number.

def century(year)
  century = 0
  if year % 100 == 0
    century = year / 100  
  else
    century = year / 100 + 1
  end

  century.to_s + suffix_number(century)
end

def suffix_number(century)
  return 'th' if [11, 12, 13].include? century % 100
  last_digit = century % 10

  case last_digit
  when 1 
    'st'
  when 2
    'nd'
  when 3
    'rd'
  else 
    'th'
  end
end

def leap_year?(year)
  if year % 4 == 0 && year % 100 == 0
    if year % 400 == 0
      return true
    else
      return false
    end
  elsif year % 4 == 0 
    true
  else
    false
  end   
end

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

def leap_year?(year)
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end

def leap_year?(year)
  if year  > 1751
    (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
  else
    year % 4 == 0
  end
end

def multisum(num)
  array = (1..num).to_a
  three_five_array = []
  array.map { |value| three_five_array << value if (value % 3 == 0 || value % 5 == 0) }
  three_five_array.inject(:+)
end

def running_total(array)
  new_array = []
  array.each_with_index do |v,i|
    new_array << (array[0..i].reduce(:+)) 
  end 
  new_array
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end


def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

STRINGS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(STRINGS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end







































