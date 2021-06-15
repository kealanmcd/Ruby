require 'minitest/autorun'

require_relative './student_body.rb'

class TestChildren < Minitest::Test
  def setup
    classes_hash = {
      english: ["john", "luke"],
      irish: ["mary"],
      history: ["Gerry"],
      geography: ["Tom", "Frederick"],
      math: ["frank"],
      science: [],
    }

    @student_body = StudentBody.new(classes_hash)
  end

  def test_all_student_names_are_unique
    student_names = @student_body.map { |name| name }
    unique_names = student_names.uniq

    assert_equal(student_names, unique_names)
  end

  def test_student_count
    expected = 7
    actual = @student_body.count
    assert_equal(expected, actual)
  end

  def test_wesley_is_not_a_student_in_the_school
    assert_nil(@student_body.find { |name| name.include?("wesley") })
  end

  def test_student_with_the_longest_name
    expected = "Frederick"
    actual = @student_body.max_by { |name| name.length }
    assert_equal(expected, actual)
  end

  def test_all_names_are_of_string_class
    all_instances_of_string = @student_body.all? { |name| name.is_a? String } ? true : false
    assert(all_instances_of_string)
  end

end