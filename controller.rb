require_relative 'view'
require_relative 'deck'

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
    until i == @deck.cards.length
      playcard = @deck.select_card
      answer = card_question_prompt(playcard)
      rightorwrong = @deck.verify(answer, playcard)
      answer_verification(rightorwrong)
      i += 1
    end
    total_correct(@deck.correct, @deck.cards.lenght)
  end
end
