require 'minitest/autorun'
require_relative './day04.rb'

class MyTests < Minitest::Test

  input = File.read("day04-input.txt").strip
  passphrases = input.split("\n")

  passphrases.each_with_index do |phrase, index|
    words = phrase.split(" ")
    
    define_method("test_phrase_has_no_repeating_words_#{index}") do
      orignal_password = words
      duplicates_removed = words.uniq      
      assert_equal(orignal_password, duplicates_removed)
    end


    define_method("test_phrase_has_no_words_that_are_anagrams_of_each_other_#{index}") do
      original_password = words.map {|i| i.chars.sort.join }
      duplicates_removed = words.uniq
      assert_equal(original_password, duplicates_removed)
    end
  end
end