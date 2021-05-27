# Part 1 - Write a Ruby program that prompts a person to enter a number, and then outputs a triangle of asterisks of that height and length.

print "Enter a number: "
input = gets.to_i

def print_triangle(input)
  i = 0

  while i < input
    i += 1
    output = ""
    j = 0
    while j < i
      output += "*"

      j += 1
    end

    puts output
  end
end

print_triangle(input)

# Part 2 - Update your program so that it outputs a triangle of asterisks that is aligned on the right side.

print "Enter a number: "
input = gets.to_i

def print_reversed_triangle(input)
  i = 0

  while i < input
    i += 1
    output = ""

    j = 0
    k = 0
    
    # print spaces
    while j < input - i
      output += " "
      j += 1
    end

    # print asterisks
    while k < i
      output += "*"
      k += 1
    end

    puts output
  end
end

print_reversed_triangle(input)

# Optional: Part 3 - Update your program so that it draws a triangle of asterisks that is centered.

print "Enter a number: "
input = gets.to_i

def print_equilateral_triangle(input)
  i = 0

  while i < input
    i += 1
    output = " "

    j = 0
    k = 0

    # print spaces
    while j < input - i
      output += " "
      j += 1
    end

    # print asterisks
    while k < i
      output += "* "
      k += 1
    end

    puts output
  end
end

print_equilateral_triangle(input)

# Optional: Part 4 - Update your program so that it draws a diamond of asterisks that is centered,
#                    with a maximum width of the entered number.

print "Enter a number: "
input = gets.to_i

def print_diamond(input)
  i = 0

  while i < (input + input - 1)
    i += 1
    output = " "

    j = 0
    k = 0
    

    # print spaces
    while (j < input - i && i < input) || (i >= input && (i - input) > j)
      output += " "
      j += 1
    end

    # print asterisks
    while (k < i && i < input) || (i >= input && input - (i % input) >  k)
      output += "* "
      k += 1
    end

    puts output
  end
end

print_diamond(input)
