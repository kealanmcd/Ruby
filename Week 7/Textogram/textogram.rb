class Histogram

  def initialize(input, case_sensitive, special_characters, integers_allowed, split_by_words)
    @input = input
    @case_sensitive = case_sensitive
    @special_characters = special_characters
    @integers_allowed = integers_allowed
    @split_by_words = split_by_words

    @histogram = {}
  end

  def build_histogram

    input = @input
    input.downcase! if !@case_sensitive
    input = @split_by_words ? input.split(' ') : input.split('')
  
    if @split_by_words

      input.each do |word|
        word = word.split("")
        extracted_word = ""


        word.each do |char|
          
          special_character = (char < "A" && char > "9") || char < "0" || (char > "z" && char <= "~")
          integer_character = char.to_i.to_s == char

          if !special_character && !integer_character

            extracted_word += char
            @histogram[extracted_word] = @histogram[extracted_word] ? @histogram[extracted_word] + "*" : "*"  if char == word.last

          else

            @histogram[extracted_word] = @histogram[extracted_word] ? @histogram[extracted_word] + "*" : "*"  if extracted_word.length > 0
            @histogram[char] = @histogram[char] ? @histogram[char] + "*" : "*"    unless (!@special_characters && special_character) || (!@integers_allowed && integer_character)
            
            extracted_word = ""
          end
        end
        
      end
    else    

      input.each do |char|
        skip_special_character = !@special_characters && ((char < "A" && char > "9") || char < "0" || (char > "z" && char <= "~"))
        skip_integer_character = !@integers_allowed && char.to_i.to_s == char

        @histogram[char] = @histogram[char] ? @histogram[char]  + "*" : "*"  unless skip_special_character || skip_integer_character

      end
    end

    @histogram = @histogram.sort.to_h
  end

  def to_s
    @histogram.each do |key, value|
      puts "#{key}: #{value}\n"
    end
  end
end

histogram = Histogram.new("Hello World he  !321 hello", true, true, true, true)
histogram.build_histogram
histogram.to_s
puts " "

string = "!@£$%^&*()_+{}:\"|<>?~`,./;'\\[]=-0987654#21€ oh and sure look the alphabet, abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
histogram_two = Histogram.new(string, true, true, true, false)
histogram_two.build_histogram
#histogram_two.to_s

guttenburg_text = File.read('project_gutenburg.txt').strip

histogram_guttenburg = Histogram.new(guttenburg_text, false, true, false, true)
histogram_guttenburg.build_histogram
#histogram_guttenburg.to_s
