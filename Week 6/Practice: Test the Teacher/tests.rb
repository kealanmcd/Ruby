require 'minitest/autorun'
require_relative './day04.rb'

class MyTests < Minitest::Test

  input = File.read("day04-input.txt").strip
  passphrases = input.split("\n")

  passphrases.each do |phrase|
    words = phrase.split(" ")
    
    define_method("test_phrase_has_no_repeating words") do
      orignal_password = words
      duplicates_removed = words.uniq      
      assert_equal(orignal_password, duplicates_removed)
    end


    define_method("test_phrase_has_no_words_that_are_anagrams_of_each_other") do
      original_password = words.map {|i| i.chars.sort.join }
      duplicates_removed = words.uniq
      assert_equal(original_password, duplicates_removed)
    end
  end
end