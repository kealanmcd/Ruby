class Planet

  def initialize(radius, mass, atmosphere, distance_from_star, num_moons)
    @radius = radius
    @mass = mass
    @atmosphere = atmosphere
    @distance_from_star = distance_from_star
    @num_moons = num_moons

    @daily_max_sunshine = 17
    @natural_disasters_count = 0

    @plants = []
    @herbivores = []
    @carnivores = []
    @omnivores = []
    @all_organisms = [@plants, @herbivores, @carnivores, @omnivores]
  end



  def colonise(organisms)
    organisms.each do |organism|
      case organism.type
      when "plant"
        @plants.push(organism)
      when "herbivore"
        @herbivores.push(organism)
      when "carnivore"
        @carnivores.push(organism)
      when "omnivore"
        @omnivores.push(organism)
      else
        puts "Sorry, #{organism.type} couldn't colonise on the planet."
      end
    end
  end



  def atmosphere_makeup
    output = ""
    @atmosphere.each do |gas, percentage|
      output += ", " if (gas != @atmosphere.keys.last && gas != @atmosphere.keys.first) && @atmosphere.length > 1
      output += " and " if gas == @atmosphere.keys.last && @atmosphere.length > 1
      output += "#{percentage}% #{gas}"
    end

    return output
  end



  def food_consumption_and_reproduction(organism, organisms_food)

    organism_consumption = organism.eat(organisms_food)

    if organism_consumption.to_i > 0
      remove_eaten_organisms(organisms_food, organism_consumption) unless organisms_food.is_a? Integer
      organisms_reproduction_cycle(organism)
    end

  end



  def remove_eaten_organisms(organisms_array, organisms_eaten)
    total_organisms = 0.0
    organisms_array.each { |organism| total_organisms += organism.population }

    percentage_of_species_remaining = 1 - (organisms_eaten.to_f / total_organisms).to_f

    reduce_organisms_percentage(organisms_array, percentage_of_species_remaining)

    organisms_array.delete_if { |organism| organism.population == 0 }
  end


  
  def reduce_organisms_percentage(organisms_array, percentage_survived)
    organisms_array.each { |i| i.kill_organism(percentage_survived) }
    organisms_array.delete_if { |organism| organism.population == 0 }
  end



  def organisms_reproduction_cycle(organism)
    organism.years_to_reproduce -= 1
    organism.reproduce if organism.years_to_reproduce <= 0
  end



  def simulate_state_of_organisms

    @plants.each { |i| food_consumption_and_reproduction(i, @daily_max_sunshine) }  if @plants.length > 0

    @herbivores.each { |i| food_consumption_and_reproduction(i, @plants) }          if @herbivores.length > 0
    @carnivores.each { |i| food_consumption_and_reproduction(i, @herbivores) }      if @carnivores.length > 0

    omnivore_food = [@plants, @herbivores].sample
    @omnivores.each { |i| food_consumption_and_reproduction(i, omnivore_food) }     if @omnivores.length > 0

  end



  def volcanic_eruption
    survival_percentage = 0.9
    @all_organisms.each { |i| reduce_organisms_percentage(i, survival_percentage) }
    @natural_disasters_count += 1
  end



  def meteorite_crash
    survival_percentage = 0.4  
    @all_organisms.each { |i| reduce_organisms_percentage(i, survival_percentage) }
    @natural_disasters_count += 1
  end



  def simulate_years(years)
    total_years = years
    years_until_meteor_disaster = 3000
    years_until_volcanic_disaster = 3

    i = 0
    while i < total_years
      
      self.volcanic_eruption if i % years_until_volcanic_disaster == 0
      self.meteorite_crash   if i % years_until_meteor_disaster == 0
      self.simulate_state_of_organisms
      
      i += 1
    end

    output = "#{years} have passed, the current population of each organism is:\n"
    output += self.output_all_organisms + "\n"
    output += "In this timeframe we've seen #{@natural_disasters_count} natural disasters."
    puts output
  end



  def output_all_organisms
    total_plants = 0
    total_herbivores = 0
    total_carnivores = 0
    total_omnivores = 0

    @plants.each { |i| total_plants += i.population }
    @herbivores.each { |i| total_herbivores += i.population }
    @carnivores.each { |i| total_carnivores += i.population }
    @omnivores.each { |i| total_omnivores += i.population }

    output = ""
    output += "Types of plants: #{@plants.length}, with a total #{total_plants}\n"
    output += "Types of herbivores: #{@herbivores.length}, with a total #{total_herbivores}\n"
    output += "Types of carnivores: #{@carnivores.length}, with a total #{total_carnivores}\n"
    output += "Types of omnivores: #{@omnivores.length}, with a total #{total_omnivores}"
    output
  end



  def to_s
    output = "This planet has:\n"
    output += "A radius of #{@radius}KMs,\n"
    output += "A weight of #{@mass}x10^24kg,\n"
    output += "Is a distance of #{@num_moons}KMs from it's nearest Sun,\n"
    output += "#{@num_moons} moons and "
    output += "an atmosphere consisting of #{atmosphere_makeup}.\n"
  end
end
