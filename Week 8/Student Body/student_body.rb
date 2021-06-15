
class StudentBody
  include Enumerable

  def initialize(classes)
    @classes = classes
  end

  def each
    @classes.each do |key, students|
      students.each do |student|
        yield student if block_given?
      end
    end
  end
end

classes = {
  english: ["john", "luke"],
  irish: ["mary"],
  history: ["Gerry"],
  geography: ["Tom"],
  math: ["frank"],
  science: [],
}

student_body = StudentBody.new(classes)
p student_body.map { |word| word.capitalize }
