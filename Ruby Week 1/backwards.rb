print "Input your first and last name: "
full_name = gets.chomp
full_name = full_name.split(' ').reverse
full_name = full_name.join(' ')

puts "Hello #{full_name}"