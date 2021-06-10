require 'minitest/autorun'

require_relative '../grade_book.rb'

class TestGradeBook < Minitest::Test
  def setup
    @grade_book = GradeBook.new
  end

  def test_the_grade_book_is_empty_when_created
    assert(@grade_book.grades.empty?)
  end

  def test_the_grade_book_accepts_name_and_number
    assert(@grade_book.add_grade("Test", 90))
  end

  def test_get_grade_method_returns_student_grade_number
    @grade_book.add_grade("Test", 90)
    expected = 90
    actual = @grade_book.get_grade("Test")
    assert_equal(actual, expected)
  end

  def test_letter_grades_method_converts_all_floats_to_string
    @grade_book.add_grade("Test", 90)
    actual = @grade_book.letter_grades
    expected = { :Test => "A" }

    assert_equal(actual, expected)
  end

  def test_letter_grade_returns_letter
    @grade_book.add_grade("Test", 90)
    assert(@grade_book.letter_grade("Test"))
  end

  def test_to_grade_method_returns_a_letter
    @number = 10.0
    expected = "F"
    actual = 10.0.to_grade
    assert_equal(actual, expected)
  end

end