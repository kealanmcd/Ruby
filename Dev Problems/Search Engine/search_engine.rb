require 'json'

module FileReader

  ID = "id"
  NAME = "name"
  PRICE = "price"

  def file_json
    file = File.read('products_small.json')
    parsed_json = JSON.parse(file)
  end
end

class SearchTerms

  include FileReader
  
  def initialize(search_term)
    @search_term = search_term
  end

  def matches_all_keywords
    
    result = search_keywords
    keywords = @search_term.split
    return result.select{ |e| result.count(e) >= keywords.length }.uniq

  end

  def matches_any_keywords

    result = search_keywords

    return result.uniq
  end

  private

  def build_inverted_index

    parsed_json = file_json

    inverted_index = {}
    parsed_json.each do |product|
      product[NAME].split.each do |token|
        inverted_index[token] ||= []
        inverted_index[token] << product[ID]
      end
    end

    return inverted_index
  end

  def search_keywords
    matches = []
    keywords = @search_term.split

    inverted_index = build_inverted_index

    keywords.length.times { |index| matches << inverted_index[keywords[index]] }

    return matches.flatten
  end

end


class SearchFilter

  include FileReader

  def initialize(args)
    @min_price = args[:min_price]
    @max_price = args[:max_price]
  end

  def price_range

    parsed_json = file_json

    result = []
    
    parsed_json.each do |product|
      if product[PRICE] >= @min_price && product[PRICE] <= @max_price
        result << product[ID]  
      end
    end

    return result
  end

end

filter_parameters = {
  :min_price => 40,
  :max_price => 70
}

p SearchTerms.new("Steel Keyboard").matches_all_keywords & SearchFilter.new(filter_parameters).price_range
p SearchTerms.new("Steel Keyboard").matches_any_keywords & SearchFilter.new(filter_parameters).price_range
