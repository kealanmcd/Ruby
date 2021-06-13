class LifeForm
  attr_reader :name, :age, :height, :satchel

  @@acceptable_items = {
    staff: 1, 
    longsword: 2, 
    wand: 5,
    spear: 1,
    potions: 20
  }

  def initialize(name, age, height)
    self.name=(name)
    self.age=(age)
    self.height=(height)
    @life_form = self.class.name.downcase
    @satchel = {}
  end

  def name=(name)
    raise "Name can't be blank" if name.empty?
    @name = name
  end

  def age=(age)
    raise "Age must be an integer value greater than 0" if age.to_i <= 0
    @age = age
  end

  def height=(height)
    raise "Height must be an integer value greater than 0" if height.to_i <= 0
    @height = height
  end

  def move
    puts "#{@name} takes 6 steps"
  end

  def speak
    puts "I'm a supreme life-form"
  end

  def give_item(item, quantity, receiver)
    item = item.to_sym
    
    raise "#{@name} isn't holding this item" if !@satchel[item]    
    if quantity >= @satchel[item]
      quantity = @satchel[item]

      puts "Only #{@satchel[item]} of this item can be passed" if quantity > @satchel[item]

      @satchel.delete(item)
    end

    receiver.receive_item(item, quantity)
  end

  def receive_item(item, quantity)
    item = item.to_sym
    raise "This is not an item #{@name} can receive" if !@@acceptable_items[item]
    raise "#{@name} can receive at most #{@@acceptable_items[item] - @satchel[item]} of this item, not #{quantity}" if (@satchel[item].to_i + quantity) > @@acceptable_items[item] 
    
    @satchel[item] = @satchel[item] ? @satchel[item] + quantity : quantity
  end

  def self.get_acceptable_item
    @@acceptable_items
  end

  def to_s
    "#{@name} is a #{@age} year old #{@life_form} who has a height of #{@height}cm"
  end
end

test = LifeForm.new("Tom", 20, 187)
puts test
puts test.move
puts test.speak
puts test.receive_item("staff", 1)


