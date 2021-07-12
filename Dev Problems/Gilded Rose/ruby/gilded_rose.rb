class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

      max_quality = 50
      min_quality = 0
      name = item.name.downcase.strip
      degradation_rate = 0

      if name.include? "brie"
        degradation_rate = item.sell_in > 0 ? -1 : -2
      elsif name.include? "backstage passes"
        if item.sell_in <= 0
          degradation_rate = item.quality
        elsif item.sell_in <= 5
          degradation_rate = -3
        elsif item.sell_in <= 10
          degradation_rate = -2
        else
          degradation_rate = -1
        end
      elsif name.include? "conjured"
        degradation_rate = item.sell_in > 0 ? 2 : 4
      else
        degradation_rate = item.sell_in > 0 ? 1 : 2
      end

      unless name.include? "sulfuras"
        new_quality = item.quality - degradation_rate
        if degradation_rate >= 0
          item.quality = [new_quality, min_quality].max
        else
          item.quality = [new_quality, max_quality].min
        end
      end

      item.sell_in -= 1

=begin
      name = item.name.downcase.strip
      
      if name.include? "brie"
        Brie.new(item).update_quality
      elsif name.include? "sulfuras"
        Sulfuras.new(item).update_quality
      elsif name.include? "backstage passes"
        BackstagePass.new(item).update_quality
      elsif name.include? "conjured"
        Conjure.new(item).update_quality
      else
        RegularPerishable.new(item).update_quality
      end
=end      
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

class RegularPerishable

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(item)
    @item = item
    @degrade_rate = degradation_rate # turn this into a method
  end
  
  def update_quality
    @item.quality = degrade_item
    @item.sell_in -= 1
  end

  private
  def degradation_rate
    @item.sell_in > 0 ? 1 : 2
  end

  def degrade_item
    new_quality = @item.quality - @degrade_rate
    new_quality = @degrade_rate > 0 ? [new_quality, 0].max : [new_quality, 50].min
    return new_quality
  end
end

class Brie
  def initialize(item)
    super(item)
    @degrade_rate = degradation_rate * -1
  end
end

class Conjure
  def initialize(item)
    super(item)
    @degrade_rate = degradation_rate * 2
  end
end

class Sulfuras
  def initialize(item)
    super(item)
  end

  def update_quality
    @item.sell_in -= 1
  end
end

class BackstagePass
  def initialize(item)
    super(item)
    @degrade_rate = degradation_rate
  end

  private
  def degradation_rate
    if @item.sell_in <= 0
      degradation_rate = @item.quality
    elsif @item.sell_in <= 5
      degradation_rate = -3
    elsif @item.sell_in <= 10
      degradation_rate = -2
    else
      degradation_rate = -1
    end
  end
end