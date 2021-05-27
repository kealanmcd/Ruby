max_attempts = 4                # A player can have a max of 4 attempts to guess the correct combo
attempt_num = 0                 # We will count each attempt
answer = ['1', '2', '3', '4']   # This is the correct combination
numbers_array = []              # The users guesses will be stored in the array


puts "MASTERMIND"

while (max_attempts > attempt_num) && (numbers_array != answer)

  attempt_num += 1
  print "[#{attempt_num}] Enter your guess: "
  numbers = gets.chomp
  numbers_array = numbers.split('')

  # If entered array is the correct length and has 1 or more same values as the answer
  if (answer & numbers_array).length && answer.length == numbers_array.length

    if answer == numbers_array                # The entered input is the answer
      
      guesses_text = attempt_num == 1 ? "guess" : "guesses"
      
      puts numbers
      puts "Nice work! You took #{attempt_num} #{guesses_text}"

    elsif (answer - numbers_array).length < answer.length
      
      correct_guesses = 'x' * (answer.length - (answer - numbers_array).length)

      count = 0
      numbers_array.each_with_index do |val, index|               # Upcase any 'x' where the number is in it's correct position
        if numbers_array[index] == answer[index]
          correct_guesses[count] = correct_guesses[count].upcase
          count += 1
        end
      end

      puts correct_guesses
    end
  end
end
