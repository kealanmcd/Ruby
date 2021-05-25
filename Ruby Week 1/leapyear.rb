year = 0

while year.to_i <= 0
  print "Enter a year: "
  year = gets.chomp

  unless year.to_i > 0
    puts "#{year} is not a valid year"
  end
end

year = year.to_i

if ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)
  puts "#{year} is leap year"
else
  puts "#{year} is not leap year"
end