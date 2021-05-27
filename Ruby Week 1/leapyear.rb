year = 0

while year <= 0
  print "Enter a year: "
  year = gets.chomp.to_i

  unless year > 0
    puts "#{year} is not a valid year"
  end
end

year_modulo_four = year % 4 == 0
year_not_modulo_hundred = year % 100 != 0
year_modulo_four_hundred = year % 400 == 0

if (year_modulo_four && year_not_modulo_hundred) || year_modulo_four_hundred
  puts "#{year} is leap year"
else
  puts "#{year} is not leap year"
end