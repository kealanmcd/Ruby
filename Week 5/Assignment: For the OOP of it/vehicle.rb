class Vehicle

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

  def drive
    puts "#{@class_name} moves down the road"
  end

  def capacity=(capacity)
    raise "Invalid vehicle capacity" if capacity.to_i <= 0
    @capacity = capacity
  end

  def insert_passenger(passenger)
    if @passenger_count.length < @capacity
      @passenger_count.push(passenger)
      yield if block_given?
    else
      puts "Sorry, this vehicle is at full capacity"
    end
  end

  def remove_passenger
    if @passenger_count.length > 0
      @passenger_count.pop()
    else
      puts "No passengers to remove"
    end
  end

  def all_passengers
    output = ""
    @passenger_count.each do |i|
      output += ", " if (i != @passenger_count.last && i != @passenger_count.first) && @passenger_count.length > 1
      output += " and " if i == @passenger_count.last && @passenger_count.length > 1
      output += "#{i}"
    end

    output += "Vehicle does not have any passengers" if @passenger_count.length == 0
    puts output
  end 
  
  def to_s
    output = "The #{@class_name} is a #{@name}. It has #{@wheels} wheels and a passenger capacity of #{@capacity}."
  end
end
