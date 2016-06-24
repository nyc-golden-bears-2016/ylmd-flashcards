require_relative 'card'

class View
  def card_question_prompt(card)
    puts "#{card.question}"
    STDIN.gets.chomp
  end

  def answer_verification(rightorwrong)
    rightorwrong ? (puts "Correct!") : (puts "Wrong!")
  end

  def total_correct(correct, total_cards)
    puts "You've answered #{correct} of #{total_cards}"
  end

end
