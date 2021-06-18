require 'minitest/autorun'

require_relative './children.rb'

class TestChildren < Minitest::Test
  def setup
    @football = Ball.new(8, "leather", 5)
    @potatoe_head = PotatoHead.new(3, "plastic")
    @jean = Jean.new("blue", 34, "cotton", 32)
    @sweater = Sweater.new("red", "M", "cotton")
    @smart_phone = SmartPhone.new("Hexa-core (2x3.1 GHz Firestorm + 4x1.8 GHz Icestorm)", 4, "iOS 14.1")
  end

  def test_football_class_successfully_initialises
    assert(@football)
  end

  def test_football_not_accessorizable
    assert_nil(defined?(@football.accessories))
  end

  def test_potatoe_head_class_successfully_initialises
    assert(@potatoe_head)
  end

  def test_potatoe_head_is_accessorizable
    assert(defined?(@potatoe_head.accessories))
  end

  def test_potatoe_head_add_accessory
    @potatoe_head.add_accessory("Arm")
    ecpected = "Arm"
    actual = @potatoe_head.accessories.find { |i| i == "Arm" }
    assert_equal(ecpected, actual)

  end

  def test_potatoe_head_remove_accessory
    @potatoe_head.add_accessory("Arm")
    accessories_length_prior_to_remove = @potatoe_head.accessories.length
    @potatoe_head.remove_accessory("Arm")
    assert(accessories_length_prior_to_remove > @potatoe_head.accessories.length)
  end


  def test_potatoe_head_accessories_unique
    potatoe_head_two = PotatoHead.new(5, "plastic")
    potatoe_head_two.add_accessory("Shoe")
    potatoe_head_two.add_accessory("Hat")

    @potatoe_head.add_accessory("Arm")
    
    assert(potatoe_head_two.accessories.length > @potatoe_head.accessories.length)
  end


  def test_jean_class_successfully_initialises
    assert(@jean)
  end

  def test_jean_is_accessorizable
    assert(defined?(@jean.accessories))
  end

  def test_sweater_class_successfully_initialises
    assert(@sweater)
  end

  def test_sweater_not_accessorizable
    assert_nil(defined?(@sweater.accessories))
  end

  def test_smart_phone_class_successfully_initialises
    assert(@smart_phone)
  end

  def test_smart_phone_is_accessorizable
    assert(defined?(@smart_phone.accessories))
  end

  def test_smart_phone_to_s_include_text_to_suggest_it_has_no_accessories_applied
    assert_output(/Does not currently have any accessories/) { @smart_phone.to_s }
  end

end