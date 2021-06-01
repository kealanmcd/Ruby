# toonie - $2
# loonie - $1
# quarter - 25c
# dime - 10c
# nickel - 5c

def how_much_change

  print "How much change is owed: "
  input = gets.to_f

  return how_much_change if input <= 0  # Recursively call itself if the inputed change is invalid (e.g -2)


  coin_types = {
    2 => :toonie,
    1 => :loonie,
    0.25 => :quarter,
    0.1 => :dime,
    0.05 => :nickel
  }

  coins_array = [2, 1, 0.25, 0.10, 0.05]
  # coins_array = coin_types.map{ |key| key[0] }    An alternate way of creating this array

  coin_count = {}   # This hash will be used to store the number of coins and types of coins that will be used in the change

  total_coins = 0
  i = 0

  while input > coins_array.last

    i += 1 until (coins_array[i] < input || i >= coins_array.length) 

    coin_name = coin_types[coins_array[i]]
    coin_count[coin_name] = coin_count[coin_name] ? coin_count[coin_name] += 1 : 1

    total_coins += 1
    input -= coins_array[i]

  end

  # We have change to dispense
  if total_coins > 0
    output =  "You need to dispense "

    # Build our output message based on the contents of our hash
    coin_count.each do |key, value|

      output += "and " if key == coin_count.keys.last && total_coins > 1
      output += "#{value} #{key}"
      output += key == coin_count.keys.last ? "." : ", "

    end
  else
    output = "You don't need to dispense change"
  end

  puts output
  puts "Total coins: #{total_coins}"

end

how_much_change