class Toy
  def initialize(minimum_age_group, material)
    @minimum_age_group = minimum_age_group
    @material = material
    @class_type = self.class.name.downcase
  end
end

class Clothing
  def initialize(color, size, material)
    @color = color
    @size = size
    @material = material
    @class_type = self.class.name.downcase
  end
end

class Computer
  def initialize(processor, ram, operating_system)
    @processor = processor
    @ram = ram
    @operating_system = operating_system
    @class_type = self.class.name.downcase
  end
end