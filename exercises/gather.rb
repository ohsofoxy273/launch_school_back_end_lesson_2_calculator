
def gather(items)
  puts "Let's start gathering food."
  yield items
  puts "Let's start gathering food."
end

items = ['apples', 'corn', 'cabbage', 'wheat'] 

gather(items) { |produce| puts produce.join('; ') }

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(array)
  yield array
end

types(birds) { |_,_,*birds_of_prey| puts birds_of_prey }