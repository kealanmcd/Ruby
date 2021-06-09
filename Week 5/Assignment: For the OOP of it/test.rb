require "./vehicle"
require "./plane"
require "./car"
require "./bus"

car = Car.new("Ford", 4, 4, "saloon")
car.drive
car.sound_horn
car.to_s

bus = Bus.new("Mercedez", 6, 40, 2000)
bus.to_s

plane = Plane.new("Airbus A380", 12, 800, "jet")
plane.to_s