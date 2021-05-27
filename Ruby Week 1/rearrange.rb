number = ""
number_converted  = number.to_i.to_s

while number != number_converted
  print "Enter a number: "
  number = gets.chomp
  number_converted = number.to_i.to_s
end

is_positive_number = number[0] != '-' ? true : false
largest_number = number.split('')

if is_positive_number
  largest_number = largest_number.sort { |a, b| b <=> a }.join
else
  largest_number = largest_number.sort { |a, b| a <=> b }.join
end

puts largest_number