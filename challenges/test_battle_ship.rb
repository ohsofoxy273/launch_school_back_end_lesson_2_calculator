require 'minitest/autorun'
require_relative 'battle_ship'

class TestGame < MiniTest::Test

  def test_get_player_name_input_returns_name
    battle = Game.new
    battle.input = StringIO.new("Joe\n")
    user_selection = battle.get_player_name
    assert_equal "Joe", user_selection
  end

  


end