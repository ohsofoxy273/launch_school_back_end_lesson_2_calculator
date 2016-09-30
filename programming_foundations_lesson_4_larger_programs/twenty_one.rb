require 'pry'

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(Spade Heart Club Diamond)

DECK = []
RANKS.map { |rank| SUITS.each { |suit| DECK << [suit, rank]}}

players_cards = []
dealers_cards = []



def deal_cards(deck, recipients_cards)
  if recipients_cards.empty?
    recipients_cards + deck.pop(2) 
  else
    recipients_cards + deck.pop(1)
  end
end

def present_hand(cards, recipient)
  puts "Player's cards are #{list_these(cards, recipient)}" if recipient == 'player'
  puts "Dealer's cards are #{list_these(cards, recipient)}" if recipient == 'dealer'
end

def list_these(cards, recipient)
  first_cards = cards[0...(cards.length-1)].map {|c| c[1] + " of " + c[0] + "s"}
  first_cards = first_cards.join(', ')
  last_card = " and " + cards.last[1] + " of " + cards.last[0] + "s."
  recipient == 'player' ? first_cards + last_card : first_cards + " and unknown."
end

def dealer_wins?(dealers_cards, players_cards)
  loop do 
    puts "Dealer's cards are #{list_these(dealers_cards, 'player')}"
    if summing(dealers_cards) < 17
      dealers_cards = deal_cards(DECK, dealers_cards)
    elsif summing(dealers_cards) <= 21 && summing(dealers_cards) >= 17
      dealers_cards = deal_cards(DECK, dealers_cards)
      return compare_cards(dealers_cards, players_cards)
    else
      puts "Dealer busts"
      return false
    end
  end
end

def compare_cards(dealers_cards, players_cards)
  if summing(dealers_cards) == summing(players_cards)
    'tie'
  else
    summing(dealers_cards) > summing(players_cards)
  end
end

def bust?(cards)
  if summing(cards) > 21
    puts "You busted"
    true
  else
    false
  end
end

def summing(cards)
  non_ace_cards = convert_face_cards_to_numbers(cards)
  non_ace_cards_sum = non_ace_cards.inject(:+)
  if cards.flatten.include?("A")
    add_aces(cards, non_ace_cards_sum) 
  else
    non_ace_cards_sum
  end
end

def convert_face_cards_to_numbers(cards)
  values = []
  cards.each {|card| values << card[1]}
  values.map! { |value| (value == 'J' || value == 'Q' || value == 'K') ? "10" : value }
  values.delete('A')
  values.map(&:to_i)
end

def add_aces(all_cards, maximum_value)
  loop do
    if all_cards.flatten.include?("A")
      calculate_ace_values(all_cards, maximum_value)
    else
      return maximum_value
    end
  end
end

def calculate_ace_values(all_cards, maximum_value)
  if maximum_value < 11
    delete_aces(all_cards)
    maximum_value += 11
  else
    delete_aces(all_cards)
    maximum_value += 1
  end
end

def delete_aces(all_cards)
  all_cards.each do |x|
    if x.include?("A")
      all_cards.delete(x)
    end
  end
end


# main game loop

DECK.shuffle!

players_cards = deal_cards(DECK, players_cards)
dealers_cards = deal_cards(DECK, dealers_cards)

present_hand(players_cards, 'player')
present_hand(dealers_cards, 'dealer')

loop do
  puts "Player, would you like to hit or stay?"
  move = gets.chomp
  
  if move.downcase.start_with?('h')
    players_cards = deal_cards(DECK, players_cards)
    present_hand(players_cards, 'player')
    present_hand(dealers_cards, 'dealer')
    if bust?(players_cards)
      puts "YOU LOST!"
      break
    end 

  elsif move.downcase.start_with?('s')
    dealers_cards = deal_cards(DECK, dealers_cards)
    present_hand(players_cards, 'player')
    
    outcome = dealer_wins?(dealers_cards, players_cards) 
    if outcome == 'tie'
      puts "A tie!"
      break
    
    elsif outcome
      #puts "Dealer's cards are #{list_these(dealers_cards, 'player')}"
      puts "Dealer wins, better luck next time!"
      break
    
    else
      puts "You win!"
      break
    end

  else
    puts 'Incorrect answer, stay or hit?'
  end

end
