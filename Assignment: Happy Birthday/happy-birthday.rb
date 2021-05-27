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


# Same code put into a method
print "What is your name? "
name = gets.chomp

def sing_happy_birthday(name)
  happy_birthday_song = "Happy birthday to you\nHappy birthday to you\nHappy birthday dear #{name}\nHappy birthday to you."
  puts happy_birthday_song
end

sing_happy_birthday(name)

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


# Same code put into a method
print "What is your name? "
name = gets.chomp

def sing_happy_birthday(name)
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
end

sing_happy_birthday(name)

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


# Same code put into a method
print "What is your name? "
name = gets.chomp

def sing_happy_birthday(name)
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

  output  # we can also write "return output" here. Ruby will default to returning the last line
end

puts sing_happy_birthday(name)