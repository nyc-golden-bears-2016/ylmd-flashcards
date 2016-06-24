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
    # @deck.set_deck(@file)
    until i == @deck.cards.length
      playcard = @deck.select_card
      answer = @view.card_question_prompt(playcard)
      rightorwrong = @deck.verify?(answer, playcard)
      @view.answer_verification(rightorwrong)
      i += 1
    end
    @view.total_correct(@deck.correct, @deck.cards.length)
  end
end
