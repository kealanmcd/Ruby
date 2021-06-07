
############################################
class Book
  attr_reader :title
  def initialize(title, page_count)
    @title = title
    @page_count = page_count
  end

  def to_s
    puts "#{@title}: #{@page_count} pages"
  end
end

############################################

class User

  def initialize(name)
    @name = name
    @current_books = []
  end

  def take_book(book_case, book)
    new_book = book_case.get_book(book)
    puts new_book
    @current_books.push(new_book) if new_book
  end

  def place_book(book_case, book_title)
    book = @current_books.find { |x| x.title = book_title }
    if book
      book_case.place_book(book);
    else
      puts "Sorry, looks like you don't have this book in the first place."
    end
  end

  def print_books
    output =  "#{@name} has currently checked out #{@current_books.length} "
    output += @current_books.length == 1 ? "book" : "books"

    puts output
  end

end

############################################

class Library
  def initialize
    @library_max_capacity = 18
    @books = {}
  end

  def place_book(book)
    if @books.length < @library_max_capacity && book.title != ""

      @books[book] = true

    else

      # Either you the library is full or you attempted adding an empty titled book
      if @books.length == @library_max_capacity
        raise "Sorry the library is full"
      else
        raise "Sorry it looks like this book has no title. We can't accept it"
      end

    end
  end


  def get_book(book)
    if !@books[book]
      raise "Sorry, this book doesn't exist in the library"
    end

    book_retrieved = @books[book]
    @books.delete(book)
    return book_retrieved

  end

  def look
    @books.each { |book| puts book.inspect }
  end

  def to_s
    puts "This Little Library can hold up to #{@library_max_capacity} with currently #{@books.length} on the shelf."
  end
end


books_array = [
  Book.new("The Lord of the Rings: The Fellowship of the Ring", 423),
  Book.new("The Lord of the Rings: The Two Towers", 352),
  Book.new("The Lord of the Rings: The Return of the King", 416),
  Book.new("The Hobbit", 304),
  Book.new("Harry Potter: Philosopher's Stone", 223),
  Book.new("Harry Potter: Chamber of Secrets", 253),
  Book.new("Harry Potter: Prisoner of Azkaban", 317),
  Book.new("Harry Potter: Goblet of Fire", 636),
  Book.new("Harry Potter: Order of the Phoenix", 766),
  Book.new("Harry Potter: Half-Blood Prince", 607),
  Book.new("Harry Potter: Deathly Hallows", 607),
  Book.new("Brave New World", 311),
  Book.new("To Kill a Mockingbird", 281),
  Book.new("The Shining", 659),
  Book.new("Nineteen Eighty-Four", 328),
  Book.new("Animal Farm", 112),
  Book.new("Charlie and the Chocolate Factory", 192),
  Book.new("Matilda", 232),
]

little_library = Library.new()

books_array.each do |x|
  little_library.place_book(x)
end
john = User.new("John")

little_library.look
little_library.to_s

john.take_book(little_library, books_array[17])
john.take_book(little_library, books_array[6])

little_library.to_s

john.print_books