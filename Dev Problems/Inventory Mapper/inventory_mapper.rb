class Shelf
  def initialize(full_unit)
    @full_unit = full_unit
  end
end

class Stool
  def initialize(top, leg_one, leg_two, leg_three)
    @top = top
    @leg_one = leg_one
    @leg_two = leg_two
    @leg_three = leg_three
  end
  
end

class Table
  def initialize(top, leg_one, leg_two, leg_three, leg_four)
    @top = top
    @leg_one = leg_one
    @leg_two = leg_two
    @leg_three = leg_three
    @leg_four = leg_four
  end
end

class Inventory
  def initialize(default_inventory={})
    @inventory = default_inventory
  end

  def add_item(item)
    @inventory[item] = @inventory[item] ? @inventory[item] + 1 : 1
  end

  def add_items(items)
    items.each do |key, value|
      @inventory[key] = @inventory[key] ? @inventory[key] + value : value
    end
  end

  def print_inventory
    @inventory.each do |key, value|
      puts "#{key} : #{value}"
    end
  end

end


class ItemParts

  attr_reader :parts

  def initialize
    @parts = {}
  end

  def add_part(part)
    @parts[part] = @parts[part] ? @parts[part] + 1 : 1
  end

  def print_parts
    @parts.each do |key, value|
      puts "#{key} : #{value}"
    end
  end

end

class ItemBuilder
  def initialize
    @all_items = []
  end

  def build_items(all_parts)
    list_of_all_items = {}

    shelf_parts = 0
    stool_parts = {}
    table_parts = {}


    all_parts.parts.each do |key, value|
      case key
      when "a"
        shelf_parts = value
      when "b".."c"
        stool_parts[key] = value
      when "d".."e"
        table_parts[key] = value
      end
    end

    build_shelf(shelf_parts)
    build_stool(stool_parts)
    build_table(table_parts)
    
    @all_items.each do |item|
      list_of_all_items[item.class] = list_of_all_items[item.class] ? list_of_all_items[item.class] + 1 : 1
    end

    return list_of_all_items
  end
  
  def build_shelf(shelfs)
    shelfs.times do
      @all_items.push(Shelf.new("a"))
    end
  end

  def build_stool(stools)
    if stools["b"] && stools["c"]
      max_tops = stools["b"]
      max_stool_legs = (stools["c"] / 3.0).to_i

      max_stools = [max_tops, max_stool_legs].min
      max_stools.times { @all_items.push(Stool.new("b", "c", "c", "c")) }
    end
  end

  def build_table(tables)
    if tables["d"] && tables["e"]
      max_tops = tables["d"]
      max_stool_legs = (tables["e"] / 4.0).to_i

      max_tables = [max_tops, max_stool_legs].min
      max_tables.times { @all_items.push(Table.new("d", "e", "e", "e", "e")) }
    end
  end

end




input = "eebeedebaceeceedeceacee"
input = input.split('')

default_inventory = {
  Shelf => 0,
  Stool => 0,
  Table => 0,
}

inventory_of_items = Inventory.new(default_inventory)
all_parts = ItemParts.new
item_builder = ItemBuilder.new

input.each do |i|
  all_parts.add_part(i)
end

all_parts.print_parts
built_items = item_builder.build_items(all_parts)
inventory_of_items.add_items(built_items)
inventory_of_items.print_inventory