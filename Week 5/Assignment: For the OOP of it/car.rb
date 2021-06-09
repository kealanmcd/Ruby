class Car < Vehicle

  def initialize(name, wheels, capacity, body_type)
    super(name, wheels, capacity)
    self.body_type = body_type
  end

  def body_type=(body_type)
    @body_type = body_type
  end

  def wheels=(wheels)
    raise "A #{@class_name} must have between 4 and 5 wheels" if wheels.to_i < 4 || wheels.to_i > 5
    @wheels = wheels
  end


  def sound_horn
    puts "beep beep"
  end

  def to_s
    output = super
    output += "\nThis #{@class_name} has a #{@body_type} body."
    puts output
  end
end