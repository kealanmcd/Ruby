require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def setup
    @vest = Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)
    @brie = Item.new(name="Aged Brie", sell_in=2, quality=0)
    @sulfuras = Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)
    @backstage_pass = Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)
    @conjured = Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)

    @items = [@vest, @brie, @sulfuras, @backstage_pass, @conjured]
  end

  def test_regular_perishable_item_reduces_each_day
    init_quality = @vest.quality
    GildedRose.new(@items).update_quality()
    quality_after_update = @vest.quality

    assert init_quality > quality_after_update
  end

  def test_regular_perishable_item_reduces_twice_as_fast_with_sell_in_equal_to_zero
    init_quality = @vest.quality
    @vest.sell_in = 0
    GildedRose.new(@items).update_quality()
    quality_after_update = @vest.quality

    quality_difference = init_quality - quality_after_update

    assert_equal(2, quality_difference)
  end

  def test_regular_perishable_quality_does_not_go_below_zero
    @vest.quality =  0
    GildedRose.new(@items).update_quality()
    
    assert_equal(0, @vest.quality)
  end

  def test_brie_increases_in_value_each_day
    init_quality = @brie.quality
    GildedRose.new(@items).update_quality()
    quality_after_update = @brie.quality

    assert quality_after_update > init_quality
  end

  def test_brie_increases_in_value_by_two_each_day_after_sell_in_is_zero
    init_quality = @brie.quality
    @brie.sell_in = 0
    GildedRose.new(@items).update_quality()
    quality_after_update = @brie.quality

    quality_difference = quality_after_update - init_quality
    
    assert_equal(2, quality_difference)
  end

  def test_brie_quality_does_not_exceed_fifty
    @brie.quality = 48
    4.times do 
      GildedRose.new(@items).update_quality()
    end

    assert_equal(50, @brie.quality)
  end

  def test_slufuras_quality_does_not_change
    init_quality = @sulfuras.quality
    4.times do 
      GildedRose.new(@items).update_quality()
    end

    assert_equal(init_quality, @sulfuras.quality)
  end

  def test_backstage_passes_increase_by_one_if_sell_in_is_greater_than_ten
    @backstage_pass.sell_in = 13
    init_quality = @backstage_pass.quality
    GildedRose.new(@items).update_quality()
    quality_after_update = @backstage_pass.quality

    quality_difference = quality_after_update - init_quality

    assert_equal(1, quality_difference)
  end

  def test_backstage_passes_increase_by_two_if_sell_in_is_greater_than_five_and_less_than_or_equal_to_ten
    @backstage_pass.sell_in = 8
    init_quality = @backstage_pass.quality
    GildedRose.new(@items).update_quality()
    quality_after_update = @backstage_pass.quality

    quality_difference = quality_after_update - init_quality

    assert_equal(2, quality_difference)
  end

  def test_backstage_passes_quality_is_zero_if_sell_in_is_less_than_or_equal_to_zero
    @backstage_pass.sell_in = 0
    init_quality = @backstage_pass.quality
    GildedRose.new(@items).update_quality()
    quality_after_update = @backstage_pass.quality

    assert_equal(0, @backstage_pass.quality)
  end


  def test_conjured_item_reduces_quality_by_two_if_sell_in_is_greater_than_zero
    init_quality = @conjured.quality
    @conjured.sell_in = 4
    GildedRose.new(@items).update_quality()
    quality_after_update = @conjured.quality

    quality_difference = init_quality - quality_after_update

    assert_equal(2, quality_difference)
  end

  def test_conjured_item_reduces_quality_by_four_if_sell_in_is_less_than_or_equal_to_zero
    init_quality = @conjured.quality
    @conjured.sell_in = 0
    GildedRose.new(@items).update_quality()
    quality_after_update = @conjured.quality

    quality_difference = init_quality - quality_after_update

    assert_equal(4, quality_difference)
  end

end