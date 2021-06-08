
def customized_list_of_multiples(multiples_of,size)
  list = (1..size).map do |i|
    i * size
  end
 
  p list

  yield list if block_given?


end

puts "Attempt 1:"
customized_list_of_multiples(5, 5) do |array|
  p "in the block"
  p array
end

puts "Attempt 2: "
customized_list_of_multiples(5, 8)

puts "Attempt 3: "
customized_list_of_multiples(3, 3) do |array|
  array.map! do |i|
    i = "replaced with string"
  end

  p array
end


puts "Attempt 4: "
customized_list_of_multiples(3, 9) do |array|
  array = array.find_all do |i|
    i > 20
  end

  p array
end

puts "Attempt 5: "
customized_list_of_multiples(7, 7) do |array|
  array = array.find_all do |i|
    i.even?
  end

  p array
end