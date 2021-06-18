class Fruit

  def to_s
    puts "Lovely Fruit"
  end
end

class Apple

  extend Fruit if Fruit.class == Module
  
  def eat
    puts "A bite has been taken out of the apple"
  end

  def to_s
    puts "A red apple"
  end

end

class Banana

  extend Fruit if Fruit.class == Module
  
  def eat
    puts "The banana is eaten"
  end

  def to_s
    puts "A yellow banana"
  end

end

class Cheese

  def eat
    puts "A slice of cheese is eaten"
  end

  def to_s
    puts "Smelly cheese"
  end
  
end

class Sausage

  def eat
    puts "The sausage is eaten"
  end

  def to_s
    puts "Pork sausage"
  end
  
end


silver_platter = [Fruit.new, Apple.new, Banana.new, Cheese.new, Sausage.new]

silver_platter.each do |i| 
  puts i.to_s
  puts i.eat if i.respond_to?(:eat) 
end