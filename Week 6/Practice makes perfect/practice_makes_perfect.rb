class Student

  def initialize(name)
    @name = name
    @study_bjects = {
      math: 80,
      english: 70,
      irish: 60,
      history: 40
    }
    @session_count = 0
  end
  
  def simulate_studying
    subject_to_study = nil
    
    @study_subjects.each do |key, value|  
      @study_subjects[key] = value - 10 
      subject_to_study = [key, @study_subjects[key]] if subject_to_study == nil || subject_to_study.last > @study_subjects[key]
    end
 
    subject_score = subject_to_study.last
    subject_score = yield subject_score if block_given?

    subject_score = [100, subject_score].min
    @study_subjects[subject_to_study.first] = subject_score
    @session_count += 1

    puts "In study session #{@session_count}, #{@name} studied #{subject_to_study.first} and now knows #{subject_score}% of the content."
  end

  def to_s
    output =  "#{@name} is studying #{@study_subjects.length} subjects. They know "
    @study_subjects.each_with_index do |pair, index|
      output += "#{pair.last}% of #{pair.first}" 
      output += ", " if @study_subjects.size > 1 && index < @study_subjects.size - 2
      output += " and " if @study_subjects.length > 1 && index == @study_subjects.size - 2
    end

    puts output
  end

end

john = Student.new("John")

john.simulate_studying { |i| i += 20 }
john.simulate_studying { |i| i += 40 }
john.simulate_studying { |i| i += 70 }
john.to_s