class Steak

  include Comparable

  GRADE_SCORES = {"Prime" => 3, "Choice" => 2, "Select" => 1}

  attr_accessor :grade

  def > (other)
    GRADE_SCORES[grade] > GRADE_SCORES[other.grade]
  end

  def <=> (other)
    if GRADE_SCORES[self.grade] < GRADE_SCORES[other.grade]
      return -1
    elsif GRADE_SCORES[self.grade] == GRADE_SCORES[other.grade]
      return 0
    else
      return 1
    end
  end

end

first_steak = Steak.new
first_steak.grade = "Prime"
second_steak = Steak.new
second_steak.grade = "Choice"

if first_steak > second_steak
  puts "I'll take #{first_steak.inspect}."
end

puts first_steak <=> second_steak
puts second_steak <=> first_steak


class WordSplitter

  include Enumerable

  attr_accessor :string

  def each
    string.split(" ").each do |word|
      yield word
    end
  end

end

=begin
splitter = WordSplitter.new
splitter.string = "how do you do"

p splitter.find_all { |word| word.include?("d") }
p splitter.reject { |word| word.include?("d") }
p splitter.map { |word| word.reverse }

p splitter.any? { |word| word.include?("e") }
p splitter.count
p splitter.first
p splitter.sort
=end

splitter = WordSplitter.new
splitter.string = "salad beefcake corn beef pasta beefy"

p splitter.find_all { |word| word.include?("beef") }
p splitter.reject { |word| word.include?("beef") }
p splitter.map { |word| word.capitalize }
p splitter.count
p splitter.find { |word| word.include?("beef") }
p splitter.first
p splitter.group_by { |word| word.include?("beef") }
p splitter.max_by { |word| word.length }
p splitter.to_a