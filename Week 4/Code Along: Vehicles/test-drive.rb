class Vehicle

  attr_accessor :odometer
  attr_accessor :gas_used

  def mileage
    @odometer / @gas_used
  end

  def accelerate
    puts "Floor it!"
  end

  def sound_horn
    puts "beep! beep"
  end

  def steer
    puts "Turn front 2 wheels."
  end

end

class Truck < Vehicle
  
  attr_accessor :cargo

  def load_bed(contents)
    puts "Securing #{contents} in the truck bed."
    @cargo = contents
  end

end

truck = Truck.new
truck.load_bed("259 bouncy balls")
puts "The truck is carrying #{truck.cargo}"

truck.odometer = 11432
truck.gas_used = 366

puts "Average MPG:"
puts truck.mileage