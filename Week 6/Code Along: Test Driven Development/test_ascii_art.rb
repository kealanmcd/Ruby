require 'minitest/autorun'

require_relative './ascii_art.rb'

class TestGradeBook < Minitest::Test
  def setup
    @ascii_art = AsciiArt.new
  end

  def test_AsciiArt_initialize_takes_no_properties
    assert(@ascii_art)
  end

  def test_AsciiArt_initialize_raises_error_if_integer_is_minus
    expected = nil
    assert_nil(actual)
  end

  def test_AsciiArt_draw_method_returns_a_string
    assert(@ascii_art.draw(0).is_a? String)
  end

  def test_AsciiArt_draw_method_returns_correct_string
    expected = "*\n**\n"
    actual = @ascii_art.draw(2)
    assert_equal(actual, expected)
  end

  def test_number_equals_one_then_the_first_and_only_output_should_be_astersisk
    expected = "*\n"
    actual = @ascii_art.draw_right_aligned(1)
    assert_equal(expected, actual)
  end

  def test_number_is_greater_than_one_then_the_first_character_should_be_a_space
    expected = @ascii_art.draw_right_aligned(4).start_with? " "
    assert(expected)
  end

  def test_first_line_should_have_number_minus_one_spaces
    expected = @ascii_art.draw_right_aligned(4).start_with? "   "
    assert(expected)
  end

  def test_after_every_asterisk_is_space
    expected = "* "
    actual = @ascii_art.draw_equilateral_triangle(3)[-3] + @ascii_art.draw_equilateral_triangle(3)[-2]
    assert_equal(expected, actual)
  end
 
  def test_first_line_equals_last_line
    first_line = @ascii_art.draw_diamond(4).scan(/\s+.+\n/).first
    last_line = @ascii_art.draw_diamond(4).scan(/\s+.+\n/).last
    assert_equal(first_line, last_line)
  end


end