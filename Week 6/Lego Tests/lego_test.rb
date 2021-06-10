require 'minitest/autorun'

require_relative './lego.rb'

class TestGradeBook < Minitest::Test
  def setup
    @hat = LegoHat.new(5, "red", "bowler")
    @sword = LegoItem.new("sword", 20)
    @knife = LegoItem.new("knife", 6)
    @tom = LegoMinifigure.new("Tom", nil, @sword, @knife)
    @john = LegoMinifigure.new("John", @hat, @sword, @knife)
  end

  def test_lego_hat_instance
    assert(@hat)
  end
  
  def test_lego_hat_to_s_method
    assert(@hat.to_s)
  end

  def test_lego_item_instance
    assert(@sword)
  end

  def test_lego_item_instance_with_wrong_number_of_arguments
    assert(sword = LegoItem.new("sword", 20, 3))
  end

  def test_lego_item_to_s
    assert(@sword.to_s)
  end

  def test_lego_item_is_heavy_method
    @expected = true
    @actual = @sword.is_heavy(10)
    assert_equal(expected, actual)
  end

  def test_lego_minifigure_instance_four_arguments
    assert(@tom = LegoMinifigure.new("Tom", @hat, @sword, @knife))
  end

  def test_lego_minifigure_instance_one_argument
    assert(@tom = LegoMinifigure.new("Tom"))
  end

  def test_lego_minifigure_to_s
    assert(@john.to_s)
  end

  def test_lego_minifigure_to_s
    assert(@john.to_s)
  end

  def test_lego_minifigure_hat_words
    assert(@john.hat_words)
  end
  
  def test_lego_minifigure_left_item_words
    assert(@tom.left_item_words)
  end

  def test_lego_minifigure_right_item_words
    assert(@tom.right_item_words)
  end

  def test_leg_minifiure_hat_stylish
    assert(@john.is_stylish?)
  end

  def test_leg_minifiure_swap_hands
    expected = @john.left_item
    swapped_hands = @john.swap_hands
    actual = swapped_hands.right_item
    assert_equal(actual, expected)
  end

  def test_leg_minifiure_wear_hat
    assert(@john.wear_hat(nil))
  end

  def test_leg_minifiure_place_in_left_hand
    assert(@john.place_in_left_hand(nil))
  end

  def test_leg_minifiure_place_in_right_hand
    assert(@john.place_in_right_hand(nil))
  end

  def test_leg_minifiure_is_strong
    expected = true
    actual = @tom.is_strong?
    assert_equal(actual, expected)
  end

end