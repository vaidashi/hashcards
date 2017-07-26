require 'pry'
require './test/test_helper'


class CardTest < Minitest::Test

  attr_reader :card, :guess

    def setup
      @card  = Card.new(question: "What is the capital of Alaska?", answer: "Juneau")
      @guess = Guess.new("Juneau", card)
    end

    def test_it_exists
      assert_instance_of Card, card
    end

    def test_it_can_return_answer_for_question
      assert_equal "What is the capital of Alaska?", card.question
      assert_equal "Juneau", card.answer
    end

    def test_user_can_enter_a_guess_and_know_if_it_is_correct
      card = Card.new(question: "What is the capital of Alaska?", answer: "Juneau")
      guess = Guess.new("Juneau", card)
      # binding.pry


      # assert_equal  <Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, guess.card
      assert_equal "Juneau", guess.response
      assert guess.correct?
      assert_equal "Correct!", guess.feedback
    end

end
