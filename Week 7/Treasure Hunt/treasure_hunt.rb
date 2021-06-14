class TreasureMap

  def initialize(treasure_map)
    @treasure_map = treasure_map
  end

  def add_food_source(position)
    raise self.coordinates_error(position) if @treasure_map[position]
    @treasure_map[position] = "F"
  end

  def add_water_source(position)
    coordinates_error(position) if @treasure_map[position]
    @treasure_map[position] = "W"
  end

  def add_treasure_location(position)
    coordinates_error(position) if @treasure_map[position]
    @treasure_map[position] = "X"
  end

  def add_source_at_coordinates(position, source)
    coordinates_error(position) if @treasure_map[position]
    @treasure_map[position] = source
  end


  def coordinates_error(position)
    raise "This co-ordinates is already assigned #{@treasure_map[position]}. Please choose different co-ordinates"
  end

  def to_s

    leftmost_value = @treasure_map.first[0][0]
    rightmost_value = @treasure_map.first[0][0]
    highest_value = @treasure_map.first[0][1]
    lowest_value = @treasure_map.first[0][1]
    
    @treasure_map.each do |key, value|
      leftmost_value = key[0] if key[0] < leftmost_value
      rightmost_value = key[0] if key[0] > rightmost_value
      highest_value = key[1] if key[1] > highest_value
      lowest_value = key[1] if key[1] < lowest_value
    end

    output = ""
    (highest_value).downto(lowest_value) do |y_axis|
      (leftmost_value).upto(rightmost_value) do |x_axis|
        position = [x_axis, y_axis]
        output += !@treasure_map[position] ? "." : @treasure_map[position]
      end
      output += "\n"
    end


    puts output

  end

end

hash = {
  [0, 1]  => "F",
  [11, 0] => "F",
  [6, -2] => "W",
  [-1, -5] => "X"
}

treasure_map = TreasureMap.new(hash)
treasure_map.add_food_source([2,2])
treasure_map.add_water_source([2,1])
treasure_map.add_treasure_location([-1,-4])
treasure_map.add_source_at_coordinates([4,-4], "F")
treasure_map.to_s