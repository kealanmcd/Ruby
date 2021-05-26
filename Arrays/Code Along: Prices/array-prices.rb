#  Old Code
=begin
def total(prices)
  amount = 0
  index = 0
  while index < prices.length
    amount += prices[index]
    index += 1
  end
  amount
end

def refund(prices)
  amount = 0
  index = 0
  while index < prices.length
    amount -= prices[index]
    index += 1
  end
  amount
end

def show_discounts(prices)
  index = 0
  while index < prices.length
    amount_off = prices[index] / 3.0
    puts format("Your discount: $%.3f", amount_off)
    index += 1
  end
end
=end

# New DRY code
def do_something_with_every_item(array, operation)
  if operation == "total" or operation == "refund"
    amount = 0
  end

  index = 0

  while index < array.length

    if operation == "total"
      amount += array[index]

    elsif operation == "refund"
      amount -= array[index]

    elsif operation == "show discounts"
      amount_off = array[index] / 3.0
      puts format("Your discount: $%.2f", amount_off)

    end

    index += 1

  end

  if operation == "total" or operation == "refund"
    return amount
  end
  
end