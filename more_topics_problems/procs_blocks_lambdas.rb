# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# group 1 demonstrates a proc
# my_proc is a proc
# my_proc class is Proc 
# calling my_proc without a parameter calls the block, no error is given, "thing" is an empty string
# my_proc.call(parameter) sends the parameter to the block

# Group 2
puts "#######"
puts 
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
#puts my_lambda
puts my_second_lambda.call("potato!")
#puts my_lambda.class
#my_lambda.call('dog')
#my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# group 2 demonstrates a lambda
# my_lambda = lambda { |thing| puts "This is a #{thing}" } raises wrong number args error
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } rais uninitialized constant Lambda

# Group 3
def block_method_1(animal)
  yield if block_given?()
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# group 3 works if block_given? method is included in the code

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

