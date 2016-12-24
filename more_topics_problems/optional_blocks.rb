def compute(&block)
  return yield if block
  'Does not compute.'
end

def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'



# Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(n, &block)
  return 'Does not compute.' unless block_given?
  yield(n)
end

