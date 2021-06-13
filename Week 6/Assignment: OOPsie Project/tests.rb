require 'minitest/autorun'

require_relative './children.rb'

class TestChildren < Minitest::Test
  def setup
    @wizard = Wizard.new("George", 200, 217, "grand")
    @knight = Knight.new("Randy", 24, 187, "tudor")
    @archer = Archer.new("Archy", 33, 177, "shortbowman")
  end

  def test_wizrads_superclass_attributes_set_correctly
    super_class_attributes_present = !@wizard.name.nil? && !@wizard.age.nil? && !@wizard.height.nil?
    assert(super_class_attributes_present)
  end

  def test_knights_superclass_attributes_set_correctly
    super_class_attributes_present = !@knight.name.nil? && !@knight.age.nil? && !@knight.height.nil?
    assert(super_class_attributes_present)
  end

  def test_archers_superclass_attributes_set_correctly
    super_class_attributes_present = !@archer.name.nil? && !@archer.age.nil? && !@archer.height.nil?
    assert(super_class_attributes_present)
  end

  def test_wizard_receives_staff
    assert(@wizard.receive_item("staff", 1))
  end

  def test_wizard_gives_knight_potion
    @wizard.receive_item("potions", 10)
    assert(@wizard.give_item("potions", 4, @knight))
  end
  
  def test_archer_name_is_not_empty
    refute_equal("", @archer.name)
  end

  def test_knight_age_is_integer
    assert_instance_of(Integer, @knight.age)
  end

  def test_wizard_speak
    expected = "I am a #{@wizard.wizard_type} wizards. I'm very powerful\n"
    assert_output(expected) { @wizard.speak }
  end

  def test_archer_speak
    expected = "I'm a supreme life-form\n"
    assert_output(expected) { @archer.speak }
  end

  def test_knight_speak
    expected = "I'm a supreme life-form\n"
    assert_output(expected) { @knight.speak }
  end

  def test_knight_only_method
    expected = "changes to a d defence stance\n"
    assert_output(expected) { @knight.defence_stance }
  end

  def test_archer_only_mehod
    expected = "#{@archer.name} lightly tip toes\n"
    assert_output(expected) { @archer.sneak }
  end

  def test_wizard_module_method
    expected = "A ball of fire is cast at the enemy\n"
    assert_output(expected) { @wizard.cast_fire_spell }
  end

  def test_knight_module_method
    expected = "Armour is now upgraded to withstand stronger attacks\n"
    assert_output(expected) { @knight.reinforce_armour }
  end

  def test_wizard_name
    refute_nil(@wizard.name)
  end

end