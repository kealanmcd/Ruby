class Shelf
  def initialize(part_id)
    @full_unit_id = part_id
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
  def initialize
    @inventory = {}
  end

  def add_inventory(item)
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

  attr_accessor :parts

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

  # schematics
  def initialize
    @all_items = []
  end

  def build_items(all_parts)
    storage = {}
    shelf = 0
    stool = {}
    table = {}


    all_parts.parts.each do |key, value|
      case key
      when "a"
        shelf = value
      when "b".."c"
        stool[key] = value
      when "d".."e"
        table[key] = value
      end
    end

    build_shelf(shelf)
    build_stool(stool)
    build_table(table)
    
    @all_items.each do |item|
      storage[item.class] = storage[item.class] ? storage[item] + 1 : 1
    end

    return storage
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
      max_tables.times { @all_items.push(Table.new("d", "e", "e", "e" "e")) }
    end
  end

end

input = "abccc"
input = input.split('')

inventory_of_items = Inventory.new
parts = ItemParts.new
item_builder = ItemBuilder.new

input.each do |i|
  parts.add_part(i)
end

parts.print_parts
items = item_builder.build_items(parts)

inventory_of_items.add_items(items)
puts "test"
inventory_of_items.print_inventory
=begin
  def assign_to_item(part)
    case part
    when "a"
      shelf_part(part)
    when "b".."c"
      stool_part(part)
    when "d".."e"
      table_part(part)
    end
  end

  def shelf_part(part)
    # create shelf if part == "a"
  end

  def stool_part(part)
    case part
    when "b"
      # Top part
    when "c"
      # Legs part
    end
  end

  def table_part(part)
    case part
    when "b"
      # Top part
    when "c"
      # Legs part
    end
  end
=end

## CLASSES
# - INVENTORY_OF_ITEMS
# - ITEM_BUILDER
# - ITEMS
#   - SHELF
#   - STOOL
#   - TABLE

# Split string
# Add characters to hash of parts
# iterate over hash of parts and build items

