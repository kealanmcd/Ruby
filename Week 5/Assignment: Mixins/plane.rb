require "./mixins"

class Plane < Vehicle
  include SkyVehicles

  def initialize(name, wheels, capacity, propulsion="jet")
    super(name, wheels, capacity)
    self.propulsion = propulsion
  end

  def propulsion=(propulsion)
    raise "Must either be jet or propeller" unless propulsion == "jet" || propulsion == "propeller"
    @propulsion = propulsion
  end

  def to_s
    output = super
    output += "\nThis #{@class_name} is powered by #{@propulsion} engine."
    puts output
  end
end