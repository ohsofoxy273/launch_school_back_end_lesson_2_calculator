require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.is_a?(Integer) || num.is_a?(Float)
end

def operation_to_message(op)
  case op
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'multiplying'
  when '4'
    'dividing'
  end

  op
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets.chomp
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  number2 = ''

  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("That doesn't look like a valid number")
    end
  end

  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) +
    2) -
    3) *
    4) /
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers.")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation ('Y' to start again)?")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator")
