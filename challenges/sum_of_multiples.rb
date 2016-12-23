

class SumOfMultiples

  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(n, multiples = [3, 5])
    (0...n).select do |integer|
      multiples.any? { |multiple| integer % multiple == 0 }
    end
    .inject(:+)
  end

  def to(n)
   SumOfMultiples.to(n, @multiples)
  end
end