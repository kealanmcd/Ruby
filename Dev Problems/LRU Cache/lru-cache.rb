=begin
    A cache object can be instantiated in memory. It requires the max number of records as an argument:

    cache = new Cache(10);
    An object may be written to a string cache key:

    cache.write('key', value);
    That object may be retrieved by a key, or null is returned if it is not found:

    cache.read('key');
    A cached value may be deleted by key:

    cache.delete('key');
    All values may be deleted:

    cache.clear();
    The number of records can be fetched at any time:

    cache.count;
    The cache should print the values when logged:

    console.log(cache);
=end

class Cache
  def initialize(max_args)
    @hash = {}
    @max_args = max_args
  end

  def write(key, value)
    delete(least_recently_used_item) if count == @max_args
    @hash[key] = value
  end

  def read(key)
    value = @hash[key]
    unless value == nil
      delete(key)
      write(key, value)
    end
    return value
  end

  def delete(key)
    @hash.delete(key) 
  end

  def clear
    current_length = count
    @hash = {}

    return current_length
  end

  def count
    @hash.length
  end

  def to_s
    output = ""
    @hash.each {|key, value| output += "#{key}: #{value}\n"}
    output
  end

  private
  def least_recently_used_item
    @hash.keys.first
  end
end

cache = Cache.new(4)
cache.write("one", 10)
cache.write("two", 21)
cache.write("three", 10)
cache.write("four", 21)

puts cache
puts cache.read("test")
puts cache.read("two")

cache.write("five", 5)
cache.write("six", "some-text")

puts cache
puts cache.count

cache.delete("four")
puts "----"
puts cache
puts cache.count

puts "----"
puts cache.clear
puts cache.count
puts cache
