In this workshop you'll continue writing unit tests in Ruby using MiniTest.

## Instructions

1. Clone the repo to your MacBook.

2. Take a look at the code in `lego.rb`.

3. Create a PR and in it describe:
    * each class
    * the purpose of each method in the class


LegoHat - class is used to create a Lego Hat that can be held by a Lego Figure.
- Class has 3 methods that define the size, colour, and style of the Lego Hat.
- The class has two methods, initialize to create the instance variables and `to_` to output the details of the hat in a string.
- There is also an attr_accesor for the @name and @weight variables so that the user can alter/read those attributes of a hat.

LegoItem - A class that creates a Lego Item that can be held by our Lego Figure. The class has 2 attributes “name” and “weight” that define the name of the item and its weight in grams.
- Has 3 methods:
- initialize to set the name and weight of the item
- is_heavy - which is a method that takes in a “threshold” parameter which compares itself against the value of the items “weight”. The method will return a boolean value, true if the weight of the item exceeds the threshold and false if it’s less than the threshold.
- to_s - prints out a string of the details of the lego item.

LegoMinifigure - A class that defines a Lego Figure. The figure can have a “name”, wear a “hat” and hold two Lego Items, a “left_item” and a “right_item”.
- The class has 11 methods
- initialise - when creating an instance of the class, it allows you to a “name” for the figure and enter optional parameters for the lego figures “hat”, “left_item” and “right_item”. If no values are given for those optional parameters then it’ll default to assign nil to those attributes.
- hat_words = checks if the lego figure has a “hat” assigned to it and if this is true, it will return text as to what hat the Lego Figure is wearing
- left_item_words - method has an initial conditional statement that checks if the lego figure is holding a “left_item”. If this is true it will then check if it’s wearing a hat.  If the Lego Figure is wearing a hat and has a left_item, then it’ll return the text “ and is holding” along with text describing the “left_item”s attributes  If the figure isn’t holding a hat but is holding an item it’ll return “, who is holding” along with details describing the “left_item” Otherwise if the figure hasn’t got anything assigned to its “left_item”, then an empty string will be returned
- right_item_words - This method is almost exactly the same as  left_item_words except that it is used to conditionally check if the user has a “right_” as opposed to a “left_item”. It also has one extra conditional that checks if “left_item” is nil.
- is_stylish? - A method that returns a boolean value. It will check if the hat the figure is wearing is “red” or “blue”. If it is either of these colours then the method will return true, otherwise it will be false.
- swap_hands - This method swaps “left_item” with “right_item”
- wear_hat - Allows the user to assign a new value to “hat”
- place_in_left_hand - Allows the user to place assign a new “left_item”
- place_in_right_hand - Similar to place_in_left_hand, it allows the user to assign a new value to the figures “right_hand”
- is_strong? - Another boolean method that will check how strong the lego figure is by calling the same LegoItem method `.is_heavy(10)` on the “left_item” and “right_item” attributes. We know from `is_heavy` above that it is a boolean method too that returns true or false based on a “threshold”. So here our is_strong? method is checking if the weight of the items “left_item”  or “right_item” have a weight that exceeds 10. If either do then it’ll return true for is_strong?, otherwise it’ll return false
- to_s - a method used to print out details about the Lego Figure (e.g it’s name, hat, left_item and right_item)



4. Next, identify the following:
    * The expected behaviours (i.e. what does the method expect as input?).
    * The limits of the cases of expected behaviour (i.e. how many arguments can the method take?) .
    * Any exceptional/error cases.


LegoHat
- Expects exactly 3 arguments when creating instance
- After creating an instance, you can read and write to all 3 of the classes attributes
- to_s  has 2 breaking errors. Its trying to access a variable “size_word” that exists nowhere in the method and it’s not calling the correct `@colour` instance variable. Instead it’s looking for “colour” which doesn’t exist.

LegoItem
- Expected exactly 2 arguments when creating instance
- After creating an instance, you can read and write to all 2 of the classes attributes

LegoMinifigure
- Expects at least one 1 argument and an option 3 extra arguments when creating an instance
- is_stylish? This assumes that what you’ve assigned to “@hat” is of the class type LegoHat. If it’s anything else then it’ll return an error
- is_strong? Assumes that both “@left_item” and “@right_item” are of the class type “LegoItem”.

For all 3 classes, they all assume that you’ll use the correct data type for each of their variables, but of course you can insert whatever you want into these variables, which in turn could cause errors. 

For example, I could easily assign integer values for all 3 of the LegoMinifigures attributes and the following methods will all output errors if it tried to call them to_s, hat_words, left_item_words, right_item_words, is_stylish?, is_strong?

The LegoMinifigure also has an unnecessary attr_accessor for everything other than :name. It has methods for altering the hat, left_item and right_item so we don’t need attr_accessor.

5. Create a new file called `lego_test.rb`.

6. In it, create tests for each of the above cases that you've identified. Remember to make commits along the way!

7. Push `lego_test.rb` to GitHub.

8. Submit the link to your PR in Canvas.