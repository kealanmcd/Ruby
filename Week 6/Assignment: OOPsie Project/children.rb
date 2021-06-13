require './parent.rb'
require './modules.rb'

class Wizard < LifeForm
  include BaseWizardSpells

  attr_reader :wizard_type
  @@acceptable_items[:cloak] = 1

  def initialize(name, age, height, wizard_type)
    super(name, age, height)
    self.wizard_type=(wizard_type)
  end

  def speak
    puts "I am a #{wizard_type} wizards. I'm very powerful"
  end

  def wizard_type=(wizard_type)
    raise "Must not be blank" if wizard_type.empty?
    @wizard_type = wizard_type
  end

  def cast_spell
    puts "#{@name} cast a magic spell"
  end

  def teleport
    puts "#{@name} teleported out of the area"
  end

end

class Knight < LifeForm
  include KnightAbilities

  attr_reader :knight_type
  @@acceptable_items[:great_sword] = 1

  def initialize(name, age, height, knight_type)
    super(name, age, height)
    self.knight_type=(knight_type)  # templar, hospistaller, teutonic
  end

  def move
    puts "Slowly moves *clunk, *clunk"
  end

  def knight_type=(knight_type)
    raise "Must not be blank" if knight_type.empty?
    @knight_type = knight_type
  end

  def attack
    puts "Attacks enemy"
  end

  def defence_stance
    puts "changes to a d defence stance"
  end

end

class Archer < LifeForm
  include ArcherAbilities

  attr_reader :archer_type
  @@acceptable_items[:short_bow] = 2

  def initialize(name, age, height, archer_type)
    super(name, age, height)
    self.archer_type=(archer_type)
  end
  
  def move
    puts "moves swiftly light stepped"
  end

  def archer_type=(archer_type)
    raise "Must not be blank" if archer_type.empty?
    @archer_type = archer_type
  end

  def draw_bow
    if @satchel[:short_bow]
      puts "#{@name} draws their bow"
    else
      puts "#{@name} does not have a bow in their satchel"
    end
  end

  def sneak
    puts "#{@name} lightly tip toes"
  end

end