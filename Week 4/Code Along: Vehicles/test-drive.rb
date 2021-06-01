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

class Car < Vehicle
end

class Motorcycle < Vehicle
  def steer
    puts "Turn front wheel"
  end
end

truck = Truck.new
truck.load_bed("259 bouncy balls")
puts "The truck is carrying #{truck.cargo}"

truck.odometer = 11432
truck.gas_used = 366

puts "Average MPG:"
puts truck.mileage

car = Car.new
puts car.instance_variables

car.odometer = 22914
car.gas_used = 728
puts car.instance_variables

motorcycle = Mortorcyle.new
motorcycle.steer


class Person
  
  def name=(new_value)
    @storage = new_value
  end

  def name
    @storage
  end

end

class Employee < Person

  def salary=(new_value)
    @storage = new_value
  end

  def salary
    @storage
  end

end

employee = Employee.new
employee.name = "John Smith"
employee.salary = 80000
puts employee.name