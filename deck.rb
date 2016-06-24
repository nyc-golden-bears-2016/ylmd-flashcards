require_relative "card"
require 'CSV'

class Deck
  attr_reader :cards
  attr_accessor :correct

  def initialize(file)
    @cards = []
    @correct = 0
    set_deck(file)
  end



  def select_card
    @cards.rotate!
    @cards[0]
  end

  def verify(response, card)
      if response == card.answwer
        correct += 1
        return true
      else
        return false
      end
  end


  private

  def set_deck(file)
    q_a = []
    File.readlines(file).each do |line|
      line = line[0..-2]
      if line == ""
      else
        q_a << line
      end
    end
    q_a.each_slice(2) do |arr|
      @cards << Card.new(arr[0], arr[1])
    end
  end

end

# flash = Deck.new('nighthawk_flashcard_data.txt')
# p flash.cards



# cards = []
# q_a = []
# File.readlines('nighthawk_flashcard_data.txt').each do |line|
#   line = line[0..-2]
#   if line == ""
#   else
#     q_a << line
#   end
# end

# q_a.each_slice(2) do |arr|
#   cards << Card.new(arr[0], arr[1])
# end





=begin


File.readlines('todo_list_data.txt').each do |line|
  if line[1] == "X"
    list.add(Item.new(line[4..-2], true))
  else
    list.add(Item.new(line[4..-2]))
  end
end

=end
