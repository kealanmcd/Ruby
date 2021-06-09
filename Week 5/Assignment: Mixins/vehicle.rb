require "./mixins"

class Vehicle
  include GlobalMethods

  def initialize(name, wheels, capacity)
    @class_name = self.class.name.downcase
    self.name = name
    self.wheels = wheels
    self.capacity = capacity

    @passenger_count = []
  end

  def name=(name)
    raise "Invalid name input" if name.length == 0 || !name.is_a?(String)
    @name = name
  end

  def wheels=(wheels)
    raise "Invalid wheels input" if wheels.to_i <= 0
    @wheels = wheels
  end

  def capacity=(capacity)
    raise "Invalid vehicle capacity" if capacity.to_i <= 0
    @capacity = capacity
  end
  
  def to_s
    output = "The #{@class_name} is a #{@name}. It has #{@wheels} wheels and a passenger capacity of #{@capacity}."
  end
end
