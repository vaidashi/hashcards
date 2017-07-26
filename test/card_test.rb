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

    def test_cards_can_be_stored_in_a_deck
      card_1 = Card.new(question: "What is the capital of Alaska?", answer: "Juneau")
      card_2 = Card.new(question: "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", answer: "Mars")
      card_3 = Card.new(question: "Describe in words the exact direction that is 697.5° clockwise from due north?", answer: "North north west")
      deck   = Deck.new([card_1, card_2, card_3])

      assert_equal [card_1, card_2, card_3], deck.cards
      assert_equal 3, deck.count
    end
end
