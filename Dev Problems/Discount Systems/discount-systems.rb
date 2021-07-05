class LineItem
  attr_reader :title, :quantity

  def initialize(title, quantity)
    @title = title
    @quantity = quantity.to_i
  end

  def line_price(price)
    price * quantity
  end
end

class Cart
  def initialize(line_items, price_computer)
    @line_items = line_items
    @price_computer = price_computer
  end

  def cart_total 
    total_price = 0

    @line_items.each do |line_item|
      total_price += @price_computer.final_price(line_item)
    end

    total_price
  end
end

class PriceComputer
  INVENTORY_PRICES = {
    grapes: 5,
    apples: 3,
    peaches: 7,
  }

  def initialize(discount_campaigns=[])
    @discount_campaigns = discount_campaigns
  end

  def line_price(line_item)
    price_per_item = INVENTORY_PRICES[line_item.title.to_sym]
    line_item.line_price(price_per_item)
  end

  def line_discount(line_item)
    discount = 0

    @discount_campaigns.each do |campaign|
      next unless campaign.match?(line_item.title, line_item.quantity)
      discount = campaign.apply_discount(line_price(line_item), line_item.quantity)
    end

    discount
  end

  def final_price(line_item)
    line_price(line_item) - line_discount(line_item)
  end

end


class ProductPercentageDiscount

  ONE_HUNDRED_PERCENT = 100.0

  def initialize(title, percentage_discount, min_quantity)
    @title = title
    @min_quantity = min_quantity
    @percentage_discount = percentage_discount / ONE_HUNDRED_PERCENT
  end

  def match?(title, quantity)
    title == @title && quantity >= @min_quantity
  end

  def apply_discount(line_price, quantity)
    line_price * @percentage_discount
  end
end

class ProductBuyOneGetOne < ProductPercentageDiscount
  def initialize(title, percentage_discount)
    super(title, percentage_discount, 2)
  end

  def apply_discount(line_price, quantity)
    full_price_items = (quantity / @min_quantity) + (quantity % @min_quantity)
    quantity_to_discount_percentage = 1 - (full_price_items / quantity.to_f)
    discount = line_price * (quantity_to_discount_percentage / @percentage_discount)
    return discount
  end
end 


discount_campaigns = [
  ProductPercentageDiscount.new("apples", 20, 2),
  ProductBuyOneGetOne.new("grapes", 100)
]

price_computer = PriceComputer.new(discount_campaigns)

# items_array = [ LineItem.new('grapes', 1), LineItem.new('apples', 0),   LineItem.new('peaches', 1) ] # output => 12
# items_array = [ LineItem.new('grapes', 1), LineItem.new('apples', 1), LineItem.new('peaches', 1) ] # output => 15
# items_array = [ LineItem.new('grapes', 2), LineItem.new('apples', 2), LineItem.new('peaches', 1) ] # output => 16.8
# items_array = [ LineItem.new('grapes', 3), LineItem.new('apples', 5), LineItem.new('peaches', 2) ] # output => 36
# items_array = [ LineItem.new('peaches', 7), LineItem.new('grapes', 7), LineItem.new('apples', 7) ] # output => 85.8

cart = Cart.new(items_array, price_computer)
puts cart.cart_total

