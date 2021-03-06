# Part 3
def verse(number)

  bottle_count = number > 0 ? number : "No more"
  bottles_text = number != 1 ? "bottles" : "bottle"

  output = "#{bottle_count} #{bottles_text} of beer on the wall,\n"
  output += "#{bottle_count} #{bottles_text} of beer.\n"

  if number > 0
    output += "Take one down and pass it around,\n"
    output += number - 1 > 0 ? "#{number - 1} " : "no more "
    
    bottles_text = number - 1 != 1 ? "bottles" : "bottle"
    output += "#{bottles_text} of beer on the wall."
  else
    output += "Go to the store and buy some more,\n"
    output += "99 bottles of beer on the wall."
  end
  

  puts output + "\n\n"

  verse(number -1) if number > 0
end

input = ""
input_int = input.to_i
input_converted_to_string = "0"

while input_converted_to_string != input || input_int < 0
  print "How many bottles are on the wall? "
  input = gets.chomp
  input_int = input.to_i
  input_converted_to_string = input.to_i.to_s
end

verse(input_int)