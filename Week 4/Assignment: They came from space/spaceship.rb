class Spaceship
  
  def initialize(organisms)
    @organisms = organisms
    @gas = 10000
    @destination = 3.25
  end

  def travel_to_destination

    @gas = [@gas - (@destination * 100), 0].max

    if @gas >= 0
      puts "You made it to your destination"
    else
      raise "Oh no, you never made it to your destination, your spaceship is now stranded in space"
    end
  end

  def blast_off(distance)
    @gas = @gas - (distance * 100)
  end

  def empty_spaceship(planet)
    planet.colonise(@organisms)
    @organisms = nil
  end

  def to_s
    puts "There are #{@organisms.length} different kinds of organisms on board the spaceship. There is #{@gas} gallons of fuel left on the ship"
  end
end