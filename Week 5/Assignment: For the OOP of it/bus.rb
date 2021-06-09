class Bus < Vehicle
  def initialize(name, wheels, capacity, cargo_size)
    super(name, wheels, capacity)
    self.cargo_size = cargo_size
  end

  def cargo_size=(cargo_size)
    raise "Cargo size must be greater than 0" unless cargo_size > 0
    @cargo_size = cargo_size
  end

  def drive
    puts "The bus driver moves away from the bus stop"
  end

  def to_s
    output = super
    output += "\nThis #{@class_name} has a maximum capacity #{@cargo_size}kg."
    puts output
  end
  
end