require './children.rb'

wizard = Wizard.new("George", 20, 187, "grand")
puts wizard
wizard.move
wizard.speak
wizard.receive_item("staff", 1)

wizard.cast_spell
wizard.cast_cure_spell
wizard.cast_fire_spell
wizard.teleport

knight = Knight.new("Randy", 20, 187, "tudor")
puts knight
knight.move
knight.speak
knight.receive_item("great_sword", 1)

knight.attack
knight.defence_stance
knight.upgrade_greatsword
knight.reinforce_armour

archer = Archer.new("Randy", 20, 187, "shortbowman")
puts archer
archer.move
archer.speak
archer.receive_item("short_bow", 1)

archer.draw_bow
archer.sneak
archer.collect_herbs
archer.hunt
archer.hunt { puts "Shoots arrow at target" }

puts Archer.get_acceptable_item