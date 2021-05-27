# Method 1

print "Input your first and last name: "
full_name = gets.chomp
full_name = full_name.split(' ').reverse.join(' ')
puts "Hello #{full_name}"

# Method 2 - no .reverse method

print "Input your first and last name: "
full_name = gets.chomp
full_name = full_name.split(' ')

i = 0
while i < full_name.length /  2

  temp = full_name[i]
  full_name[i] = full_name[full_name.length - 1 - i]
  full_name[full_name.length - 1 - i] = temp

  i += 1
end

full_name = full_name.join(' ')

puts "Hello #{full_name}"

# Method 3

print "Input your first and last name: "
full_name = gets.chomp
full_name = full_name.split(' ')
reversed_name = ""

i = 0
while i < full_name.length

  reversed_name += full_name[full_name.length - i - 1] + " "

  i += 1
end

puts "Hello #{reversed_name}"