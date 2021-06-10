class Domino
  def initialize(top_half, bottom_half)
    @top_half = top_half
    @bottom_half = bottom_half
  end


  # print out domino shape

  def outputDomino
    number = 4

    puts " ___ "

    key = 9.0 / number

    dot = 1
    offset = 0
    offset = number - 5 if number < 5

    (1..10).each do |i|
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
=begin
  void outputDomino(int number, string dominoHalf)
  {
  
    // Print the top layer of the domino first if we're outputting the upper half of the domino
    if (dominoHalf == "upper") {
      cout << " ___ " << endl;
    }
  
    double key = 9.0 / number;    // The amount of times "number" can be divided into 9 is used to formulate where to output each "*"
  
    int dot = 1;            // "dot" represents the current "*" that needs to be outputted and is incremented each time the index position for each "*" is found. Each time the the poisition of "*" is found, the "dot" value increases.
    int offset = 0;         // If outputing the pattern for numbers [1-4], these require an initial offset value in find it's correct index position
    if (number < 5) {
      offset = number - 5;
    }
  
    for (int i = 1; i < 10; i++) {
      if (i % 3 == 1) { cout << "|"; }            // Prints the left side of the domino using a "|" character
  
      if (number == 4 && dot == 3) {
        offset = 1;
      } else if ((number == 4 && dot == 4) || (number == 2 && dot == 2)) {
        offset = 0;
      }
  
      if (i == floor(key * dot) + offset) {       // Print a "*" character when its correct index position is found
        cout << "*";
        dot++;
        if (number == 3) { offset += 1; }
      } else {
        cout << " ";
      }
      if (i % 3 == 0) { cout << "|" << endl; }    // prints the right side of the domino using a "|" character
    }
  
  
    // If we're outputting the upper half of the domino, print the divider between the upper and lower half
    if (dominoHalf == "upper") {
      cout << "|---|" << endl;
    } else {
      cout << " --- " << endl;
    }
  }
=end

  def to_s
  end
end