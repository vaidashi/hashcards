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
      card  = Card.new(question: "What is the capital of Alaska?", answer: "Juneau")
      guess = Guess.new("Juneau", card)
      answer_1 = guess.card.class

      assert Card, answer_1
      assert_equal "Juneau", guess.response
      assert guess.correct?
      assert_equal "Correct!", guess.feedback
    end

    def test_user_can_enter_a_guess_and_know_if_it_is_wrong
      card  = Card.new(question: "Which planet is closest to the sun?", answer: "Mercury")
      guess = Guess.new("Saturn", card)
      answer_1 = guess.card.class

      assert Card, answer_1
      assert_equal "Saturn", guess.response
      refute guess.correct?
      assert_equal "Incorrect", guess.feedback
    end

end
