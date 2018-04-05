require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_a_response_for_start
    game = Game.new
    assert_equal "Start Guessing", game.start
  end

  def test_it_can_create_a_random_number
    game = Game.new
    assert game.number.between?(0, 100)
  end

  def test_it_it_has_a_default_answer_false
    game = Game.new
    assert_equal false, game.answer
  end

  def test_the_answer
    game = Game.new
    ass
  end
end
