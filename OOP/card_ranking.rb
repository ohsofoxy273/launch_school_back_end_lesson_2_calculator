require 'Pry'

class Card
  attr_reader :rank, :suit
  include Comparable

  VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }.freeze

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(another)
    value <=> another.value
  end

  def value
    VALUES.fetch(rank, rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end


class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    @deck.shuffle!
  end
end

class PokerHand
  def initialize(deck)
    @deck = deck
    draw_hand
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private
  attr_reader :deck, :hand

  def royal_flush?
    return false unless sorted_values.last == 14
    straight_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    n_of_kind?(4)
  end

  def full_house?
    n_of_kind?(3) && n_of_kind?(2)
  end

  def flush?
    suit = hand.first.suit
    hand.all? { |card| card.suit == suit }
  end

  def straight?
    sorted_values == (sorted_values.first..sorted_values.first + 4).to_a
  end

  def three_of_a_kind?
    n_of_kind?(3)
  end

  def two_pair?
    rank_count.select { |_, count| count == 2 }.size == 2
  end

  def pair?
    n_of_kind?(2)
  end

  def n_of_kind?(n)
    rank_count.one? { |_, count| count == n }
  end

  def rank_count   
    values_hash = Hash.new(0) # {value => count}
    sorted_values.each do |value|
        values_hash[value] +=1 
      end
    values_hash
  end

  def draw_hand
    @hand = []
    5.times { hand << deck.draw }
  end

  def sorted_values
    hand.map {|card| card.value}.sort 
  end
end


hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

