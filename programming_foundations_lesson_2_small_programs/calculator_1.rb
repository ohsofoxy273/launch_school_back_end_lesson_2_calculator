Kernel.puts("Welcome to Calculator")

Kernel.puts("What's the first number?")
number1 = gets().chomp()

Kernel.puts("What's the second number?")
number2 = gets().chomp()

Kernel.puts("What operation would you like to perform? 1) +, 2) -, 3) *, or 4) / ?")
 operator = Kernel.gets().chomp()

if operator == "1"
  result = number1.to_i + number2.to_i
elsif operator == "2"
  result = number1.to_i - number2.to_i
elsif operator == "3"
  result = number1.to_i * number2.to_i
elsif operator == "4"
  result = number1.to_f / number2.to_f
end

Kernel.puts("The result is #{result}")