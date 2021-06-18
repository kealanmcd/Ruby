module Accessorizable
  def accessories
    @accessories ||= []
  end


  def add_accessory(accessory)     # will add a given string to a list stored as an attribute in the module
    @accessories.push(accessory)
  end

  def remove_accessory(accessory)  # will remove a given string from the list
    @accessories.delete(accessory)
  end

  def accessories_to_s  # will return a nicely formatted sentence fragment describing the accessories an object might have
    if @accessories.size > 0
      puts "Has the accessories:"
      output = ""
      @accessories.each_with_index do |accessory, index|
        output += "#{accessory}" 
        output += ", " if @accessories.size > 1 && index < @accessories.size - 2
        output += " and " if @accessories.length > 1 && index == @accessories.size - 2
      end
      puts output      
    else
      puts "Does not currently have any accessories."
    end

  end

end