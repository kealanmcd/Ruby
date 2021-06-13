class AsciiArt

  def draw(number)
    raise "Value can't be a minus or non integer" if !number.is_a? Integer || number < 0

    output = ""
    i = 1
    while i <= number
      output += "*" * i + "\n"
      i += 1
    end
    output
  end

  # Part 2: Right aligned triangle
  def draw_right_aligned(number)
    raise "Value can't be a minus or non integer" if !number.is_a? Integer || number < 0

    output = ""
    i = 1
    while i <= number
      output += " " * (number - i)
      output += "*" * i + "\n"
      i += 1
    end

    output
  end

  # Part 3: Equilateral triangle
  def draw_equilateral_triangle(number)
    raise "Value can't be a minus or non integer" if !number.is_a? Integer || number < 0

    output = ""
    i = 1
    while i <= number
      output += " " * (number - i)
      output += "* " * i + "\n"
      i += 1
    end

    output
  end

  # Part 4: Diamond
  def draw_diamond(number)
    raise "Value can't be a minus or non integer" if !number.is_a? Integer || number < 0

    output = ""
    i = 1

    while i <= number * 2

      if i < number
        output += " " * (number - i)
        output += "* " * i
      else
        output += " " * (i % number) 
        output += "* " * (number * 2 - i)
      end
      output += "\n"
      i += 1
    end

    output
  end
  
end