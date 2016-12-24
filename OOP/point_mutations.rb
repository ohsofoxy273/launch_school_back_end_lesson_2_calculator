
class DNA
  attr_reader :dna_strand

  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(other_strand)
    counter = 0
    dna_strand.chars.each_with_index do |char, index|
      break if other_strand[index] == " " || index + 1 > other_strand.size
      counter += 1 if char != other_strand[index]
    end
    counter
  end

end