class Organism

  attr_reader :population, :type
  attr_accessor :years_to_reproduce

  def initialize(reproduce_rate, population, food_need, min_chance_meeting_food_requirement)
    @reproduce_rate = reproduce_rate
    @population = population
    @food_need = food_need

    @type = self.class.name.downcase
    @years_to_reproduce = @reproduce_rate
    @min_chance_meeting_food_requirement = min_chance_meeting_food_requirement
  end

  def kill_organism(amount)
    @population = (@population * amount).round
  end

  def reproduce
    @population *= 2
    @years_to_reproduce = @reproduce_rate
  end

  def eat(organism_array)
    total_available_food = 0
    total_amount_of_food_needed = @food_need * @population

    organism_array.each { |organism| total_available_food += organism.population }

    max_consumable_food = [total_available_food, total_amount_of_food_needed].min
    min_consumable_food = (max_consumable_food.to_f * @min_chance_meeting_food_requirement).to_i
    
    food_consumed = rand(min_consumable_food..max_consumable_food).to_i 

    return food_consumed
    
  end

  def to_s
    output = "This organism is a #{self.class.name}. The current population of the #{self.class.name} is #{@population}."
    output += "\nIt takes #{@reproduce_rate} weeks for this organism to reproduce."
    output
  end

end

class Plant < Organism

  def eat(max_sunshine)
   min_sunshine = max_sunshine * @min_chance_meeting_food_requirement
   hours_of_sunshine = rand(min_sunshine..max_sunshine)

   return hours_of_sunshine >= @food_need ? hours_of_sunshine : 0
  end

  def to_s
    output = super
    output += "\nA monthly amount of #{@food_need} hours of sunlight is needed in order to survive"
    output
  end
end

class Herbivore < Organism

  def to_s
    output = super
    output += "\nA monthly amount of #{@food_need} plants needs to be consumed to survive"
    output
  end
end

class Carnivore < Organism

  def to_s
    output = super
    output += "\nA monthly amount of #{@food_need} meat needs to be consumed to survive"
    output
  end
end

class Omnivore < Organism

  def to_s
    output = super
    output += "\nA monthly amount of #{@food_need} of meat or plants needs to be consumed to survive"
    output
  end

end
