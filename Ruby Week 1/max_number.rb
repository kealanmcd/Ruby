# Find the max number between two valid inputs

first_num_str = ""
first_num_converted = first_num_str.to_i.to_s

second_num_str = ""
second_num_converted = second_num_str.to_i.to_s


while first_num_str != first_num_converted || second_num_str != second_num_converted
  
  print "Enter a number: "
  first_num_str = gets.chomp
  first_num_converted = first_num_str.to_i.to_s

  print "Enter another number: "
  second_num_str = gets.chomp
  second_num_converted = second_num_str.to_i.to_s

end

max_number = first_num_str.to_i >= second_num_str.to_i ? first_num_str : second_num_str
puts "Max: #{max_number}"