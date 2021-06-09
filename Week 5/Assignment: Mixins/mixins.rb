module GlobalMethods
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
end

module LandVehicles
  def drive
    puts "#{@class_name} is driven down the road"
  end

  def sound_horn
    puts "beep beep"
  end
end

module SkyVehicles
  def fly
    if @propulsion == "jet"
      puts "The jet engines power the plane down the runway"
    else
      puts "The propellers start spinning to lift the plane off the ground"
    end
  end
end
