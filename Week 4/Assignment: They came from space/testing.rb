require "./organisms"
require "./planet"
require "./spaceship"

organisms_to_colonise_planet = [
  Plant.new(51, 20000, 6, 0.80),
  Plant.new(51, 39000, 6, 0.80),
  Plant.new(51, 32000, 6, 0.80),
  Plant.new(51, 22000, 6, 0.80),

  Herbivore.new(4, 277, 10, 0.85),
  Herbivore.new(8, 200, 30, 0.85),
  Herbivore.new(5, 270, 25, 0.8),
  Herbivore.new(12, 500, 13, 0.85),

  Carnivore.new(4, 7, 4, 0.45),
  Carnivore.new(3, 6, 5, 0.45),
  Carnivore.new(8, 5, 8, 0.45),  
  Carnivore.new(8, 4, 12, 0.95),

  Omnivore.new(10, 2, 1, 0.95)
] 


rocket = Spaceship.new(organisms_to_colonise_planet)

puts rocket
rocket.blast_off(0.9)
rocket.travel_to_destination
puts rocket

planets_atmosphere = {
  "Oxygen": 20.95,
  "Nitrogen": 78.09,
  "Argon": 0.93,
  "Carbon-dioxide": 0.03
}

kepler_1649c = Planet.new(6753.3, 7.1664, planets_atmosphere, 9710000, 2)
puts kepler_1649c

rocket.empty_spaceship(kepler_1649c)
puts kepler_1649c.output_all_organisms

kepler_1649c.simulate_years(1000000)
puts kepler_1649c.output_all_organisms

