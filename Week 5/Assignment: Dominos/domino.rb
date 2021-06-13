class Domino
  @@double_six_set = []
  attr_accessor :top_half, :bottom_half

  def initialize(top_half, bottom_half)
    @top_half = top_half
    @bottom_half = bottom_half
  end
  
  def output_domino(number)

    key = number == 0 ? 0 : 9.0 / number

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


  # Part 2: Double six set
  def self.build_double_six_set()
   top_half_integer = 0
   bottom_half_integer = 0
    while bottom_half_integer < 7

      domino_set = Domino.new(top_half_integer, bottom_half_integer)

      if top_half_integer == bottom_half_integer
        bottom_half_integer += 1
        top_half_integer = 0
      else
        top_half_integer += 1
      end
      
      @@double_six_set.push(domino_set)
    end

  end

  def self.print_dominoes_array(array=@@double_six_set)
    array.each { |i| puts i.to_s }#  "#{i.top_half} :  #{i.bottom_half}" }
  end

  # Part 3: Swap tops and bottoms
  def self.swap_tops_and_bottoms
    @@double_six_set.map! do |domino| 
      temp = domino.top_half
      domino.top_half = domino.bottom_half
      domino.bottom_half = temp
      domino
    end
  end

  # Part 4: find_dominoes_with
  def find_dominoes_with(number, side="top")
    if side == "top"
      resulting_array = @@double_six_set.find_all { |domino| domino.top_half == number }
    elsif side == "bottom"
      resulting_array = @@double_six_set.find_all { |domino| domino.bottom_half == number }
    end
    self.class.print_dominoes_array(resulting_array)
  end

  def to_s
    puts " ___ "
    output_domino(@top_half)
    puts "|---|"
    output_domino(@bottom_half)
    puts " --- "
  end
end

domino = Domino.new(2,5)
domino.to_s
x = []
Domino.build_double_six_set
Domino.print_dominoes_array

Domino.swap_tops_and_bottoms
Domino.print_dominoes_array

domino.find_dominoes_with(3)