class Product
  attr_reader :title, :rating, :price

  def initialize(args)
    @title = args[:title]
    @rating = args[:rating].to_i
    @price = args[:price].to_i
  end

  def rating_sort(product)
    [product.rating, price] <=> [rating, product.price]
  end

  def to_s
    "#{@title}, has a rating of #{@rating} and costs $#{@price}"
  end
end

class Catalogue
  def initialize(array)
    @products = array
  end

  def sort_by_rating
    @products.sort! { |a, b| a.rating_sort(b) }
  end

  def << (product)
    @products << product
  end

  def product_titles
    @products.each { |product| puts product.title }
  end
end


input_array = [
  "Selfie Stick,98,29",
  "iPhone Case,90,15",
  "Fire TV Stick,48,49",
  "Wyze Cam,48,25",
  "Water Filter,56,49",
  "Blue Light Blocking Glasses,90,16",
  "Ice Maker,47,119",
  "Video Doorbell,47,199",
  "AA Batteries,64,12",
  "Disinfecting Wipes,37,12",
  "Baseball Cards,73,16",
  "Winter Gloves,32,112",
  "Microphone,44,22",
  "Pet Kennel,5,24",
  "Jenga Classic Game,100,7",
  "Ink Cartridges,88,45",
  "Instant Pot,98,59",
  "Hoze Nozzle,74,26",
  "Gift Card,45,25",
  "Keyboard,82,19"
]

products_array = input_array.map do |product|
  item = product.split(',')
  Product.new(
    {
      :title =>item[0], 
      :rating => item[1], 
      :price => item[2]
    }
  )
end

# products_array.sort! { |a, b| a.rating_sort(b) }
# products_array.each { |i| p i.title }

collection = Catalogue.new(products_array)
collection.sort_by_rating
collection.product_titles
