
require './test/test_helper'


class CardTest < Minitest::Test

  attr_reader :card

    def setup
      @card = Card.new(question: "What is the capital of Alaska?", answer: "Juneau")
    end

    def test_it_exists
      assert_instance_of Card, card
    end

    def test_it_can_return_answer_for_question
      assert_equal "What is the capital of Alaska?", card.question
      assert_equal "Juneau", card.answer
    end

end
