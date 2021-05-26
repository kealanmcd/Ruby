# Write a Ruby program that asks a person for their name, and outputs the Happy Birthday to 
# You song for them https://en.wikipedia.org/wiki/Happy_Birthday_to_You


# Part 1 - do not use any loops or conditional statements.

print "What is your name? "
name = gets.chomp

happy_birthday_song = "Happy birthday to you
Happy birthday to you
Happy birthday dear #{name}
Happy birthday to you."

puts happy_birthday_song
puts " "

# Part 2 - Update your program to only contain the string “Happy birthday” once by using a 
#          while loop and an if statement.

print "What is your name? "
name = gets.chomp
i = 0

while i < 4
  print "Happy birthday"
  if i == 2
    print " dear #{name}\n"
  else
    print " to you\n"
  end

  i += 1
end

puts " "

# Part 3 - Update your program to only contain the string “Happy birthday” 
#          once by using an until loop and a case statement and without using the print method.

print "What is your name? "
name = gets.chomp
i = 0
output = ""

until i >= 4
  output += "Happy birthday"

  case i
  when 2
    output += " dear #{name} \n"
  else
    output += " to you\n"
  end

  i += 1
end

puts output