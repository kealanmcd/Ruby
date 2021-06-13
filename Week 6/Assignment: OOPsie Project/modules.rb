module BaseWizardSpells
  def cast_cure_spell
    puts "#{@name} casts a spell to cure themselves"
  end

  def cast_fire_spell
    puts "A ball of fire is cast at the enemy"
  end
end

module KnightAbilities
  def reinforce_armour
    puts "Armour is now upgraded to withstand stronger attacks"
  end

  def upgrade_greatsword
    if !@satchel[:great_sword]
      puts "No great sword to upgrade"
    else
      puts "Great sword upgraded to provide a higher attack power"
    end
  end
end

module ArcherAbilities
  def collect_herbs
    puts "#{@name} gathers herbs on the ground"
  end

  def hunt
    if !@satchel[:short_bow]
      puts "You can't hunt without a short bow"
    else
      puts "#{@name} draws their short bow to go hunting"
      yield if block_given?
    end
  end
end