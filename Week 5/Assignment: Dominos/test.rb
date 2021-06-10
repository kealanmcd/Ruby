class Domino
  def initialize(top_half, bottom_half)
    @top_half = top_half
    @bottom_half = bottom_half
    @big_array  = []
  end
  
  def outputDomino(number)

    key = 9.0 / number

    dot = 1
    offset = 0
    offset = number - 5 if number < 5

    (1...10).each do |i|
      print "|" if i % 3 == 1
      if number == 4 && dot == 3
        offset = 1
      elsif (number == 4 && dot == 4) || (number == 2 && dot == 2)
        offset = 0
      end

      if (i == (key * dot).to_i + offset)
        print "*"
        dot += 1
        offset += 1 if (number == 3)
      else
        print " "
      end
      print "|\n" if (i % 3 == 0) 

    end
  end


  def double_six_set
  end

  # part 2: A class method
  def buildDoubleSixSet(array)

   arrayIndex = 0
   topInt = 0
   bottomInt = 0
    while (topInt != 7 && bottomInt != 7) 

      domino_set = [
        topInt,
        bottomInt
      ]

      if (topInt == bottomInt) 
        bottomInt += 1
        topInt = 0
      else
        topInt += 1
      end
      
      array[arrayIndex] = domino_set
      arrayIndex += 1
    end

    @big_array = array
  end

  def get_array
    p @big_array
  end

  # Part 3: Swap tops and bottoms
  def swap_tops_and_bottoms
    @big_array.map! { |i| i.reverse }
  end

  # Part 4: find_dominoes_with

  def find_dominoes_with(number, side="top")
    new_array = @big_array.find_all { |i| i.first == number }
    puts " "
    p new_array
  end

  def to_s
    puts " ___ "
    outputDomino(@top_half)
    puts "|---|"
    outputDomino(@bottom_half)
    puts " --- "
  end
end

domino = Domino.new(2,5)
domino.to_s
x = []
domino.buildDoubleSixSet(x)
domino.get_array

domino.swap_tops_and_bottoms
domino.get_array

domino.find_dominoes_with(3)