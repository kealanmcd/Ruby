# Part 1 - Write a Ruby program that prompts a person to enter a number, and then outputs a triangle of asterisks of that height and length.

print "Enter a number: "
input = gets.to_i
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

# Part 2 - Update your program so that it outputs a triangle of asterisks that is aligned on the right side.

print "Enter a number: "
input = gets.to_i
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