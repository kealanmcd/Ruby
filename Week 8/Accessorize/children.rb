require './parents'
require './mixins'

class Ball < Toy
  def initialize(minimum_age_group, material, size) # 4, 5 leather
    super minimum_age_group, material
    @size = size
  end

  def to_s
    puts "A size #{@size} #{@class_type} suitable for age groups #{minimum_age_group}+"
  end
end

class PotatoHead < Toy

  include Accessorizable

  def initialize(minimum_age_group, material)
    super minimum_age_group, material
    accessories
  end

  def to_s
    puts "A Mr. #{@class_type} toy suitable for ages #{@minimum_age_group} and is made from #{@material}."
    accessories_to_s
  end
end

class Jean < Clothing

  include Accessorizable

  def initialize(color, size, material, length)
    super color, size, material
    @length = length
    create_accessories
  end

  def to_s
    puts "A pair of #{@color} #{@class_type}s that are size #{@size} and a length of #{@length}."
    accessories_to_s
  end
end

class Sweater < Clothing
  
  def initialize(color, size, material)
    super color, size, material
  end

  def to_s
    puts "A #{@size} size #{@color} #{@class_type}."
  end
end

class SmartPhone < Computer
  
  include Accessorizable

  def initialize(processor, ram, operating_system)
    super processor, ram, operating_system
  end

  def to_s
    puts "A #{@class_type} with a #{@operating_system} processor and #{@ram}GB of RAM."
    accessories_to_s
  end
end

p potatoe_head = PotatoHead.new(3, "plastic")
p potatoe_head

potatoe_head.add_accessory("left arm")
potatoe_head.to_s
puts " "
p potatoe_head_two = PotatoHead.new(21, "plastic")
potatoe_head_two.add_accessory("a gun")
potatoe_head_two.to_s

puts " "
p potatoe_head
p potatoe_head_two