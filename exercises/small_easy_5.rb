require 'pry'

def ascii_value(string)
  string == '' ? 0 : string.chars.map { |char| char.ord }.inject(:+)
end

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

def time_of_day(int_mins)
  int_mins = 1440 + int_mins if int_mins < 0
  hours = int_mins / 60
  mins = int_mins  % 60
  hours = hours / 24 if hours > 24
  mins = '0' + mins.to_s if mins < 10 && mins >= 0
  hours = '0' + hours.to_s if hours < 10 && hours >= 0 
  "#{hours}:#{mins}"
end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

def after_midnight(string)
  hours = string.chars[0..1].join.to_i
  mins = string.chars[3..4].join.to_i
  (hours % 24) * 60 + mins
end

def before_midnight(string)
  hours = string.chars[0..1].join.to_i
  mins = string.chars[3..4].join.to_i
  1440 - ((hours % 24) * 60 + mins)
end

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

def letter_swap(string)
  if string.size == 0 || string.size == 1
    string
  elsif string.size == 2
    string[-1] + string[0]
  else
    first_letter = string[0]
    last_letter = string[-1]
    last_letter + (string[1..-2] || string[]) + first_letter
  end
end

def swap(string)
  string.split.map! { |word| letter_swap(word) }.join(" ")
end


def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

def cleanup(string)
  string.gsub(/\W/ ,' ').split.join(' ')
end

def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

def word_sizes(string)
  word_size_hash = {}
  string.split.each do |word|
    if word_size_hash[word.size]
      word_size_hash[word.size] = (word_size_hash[word.size] + 1)
    else
      word_size_hash[word.size] = 1
    end
  end
  word_size_hash
end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    word = word.delete('^A-Za-z')
    counts[word.size] += 1
  end
  counts
end

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

def crunch(string)
  new_string = ''
  i = 0
  while i < string.length
    new_string << string[i] unless string[i] == string[i+1]
    i += 1
  end
  new_string
end


def print_in_box(string)
  puts '+' + '-' * (string.length || 0) + '-' + '+'
  puts '|' + ' ' * string.length + ' ' + '|'
  puts '|' + ' ' + string + '|'
  puts '|' + ' ' * string.length + ' ' + '|'
  puts '+' + '-' * (string.length || 0) + '-' + '+'
end























