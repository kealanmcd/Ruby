lines = []

review_file = File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

puts review_file.class 
puts "Line 4: #{lines[3]}"
puts "Line 1: #{lines[0]}"

puts lines.length
