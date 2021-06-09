require "./vehicle"
require "./plane"
require "./car"
require "./bus"

car = Car.new("Ford", 4, 4, "saloon")
car.drive
car.sound_horn
car.to_s
car.insert_passenger("Tom")
car.insert_passenger("John")
car.insert_passenger("Wesley")
car.insert_passenger("Mary")
car.insert_passenger("Frank")


bus = Bus.new("Mercedez", 6, 40, 2000)
bus.to_s
bus.insert_passenger("Frank")


plane = Plane.new("Airbus A380", 12, 800, "jet")
plane.to_s
plane.insert_passenger("Roger")
