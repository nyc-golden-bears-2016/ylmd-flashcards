class Controller

  attr_reader :deck, :view

  def initialize(file)
    @deck = Deck.new(file)
    @view = View.new
    @file = file
  end

  def play_game
    i = 0
    @deck.set_deck(@file)
    until i = @deck.cards.length
      playcard = @deck.select_card
      puts playcard.question
      answer = gets.chomp
      point = @deck.verify(answer, playcard)
      if point
        puts "Correct!"
      else
        puts "Wrong!"
      end
      i += 1
    end
    puts "You've answered #{@correct} of #{@deck.cards.length}"
  end

end
