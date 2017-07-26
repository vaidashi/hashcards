
require './lib/card'

class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards  = []
  end

  def cards
    @cards << @card
  end

end
