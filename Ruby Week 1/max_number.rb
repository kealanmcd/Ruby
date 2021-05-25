first_num = "First integer"
second_num = "Second integer"

while first_num != first_num.to_i.to_s || second_num != second_num.to_i.to_s
  print "Enter a number: "
  first_num = gets.chomp
  print "Enter another number: "
  second_num = gets.chomp
end

max_number = first_num.to_i >= second_num.to_i ? first_num : second_num
puts "Max: #{max_number}"