max_attempts = 4
attempt_num = 0
answer = ['1', '2', '3', '4']
numbers_array = []


puts "MASTERMIND"

while (max_attempts > attempt_num) && (numbers_array != answer)
  attempt_num += 1
  print "[#{attempt_num}] Enter your guess: "
  numbers = gets.chomp
  numbers_array = numbers.split('')

  # If entered array is the correct length and has 1 or more same values as the answer
  if (answer & numbers_array).length && answer.length == numbers_array.length

    if answer == numbers_array                # The entered input is the answer
      puts numbers
      puts "Nice work! You took #{attempt_num} guesses"
    elsif (answer - numbers_array).length < answer.length
      
      correct_guesses = 'x' * (answer.length - (answer - numbers_array).length)

      count = 0
      numbers_array.each_with_index do |val, index|
        if numbers_array[index] == answer[index]
          correct_guesses[count] = correct_guesses[count].upcase
          count += 1
        end
      end

      puts correct_guesses
    end
  end
end
