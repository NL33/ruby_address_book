class Address

  @@all_addresses = []

  def Address.all
    @@all_addresses
  end

  def initialize(address)  #note for more thorough approach, could: def initialize(number, street, city, state, zip)
                            #would then create methods for each, like def @number...@number=number...end, and then a method
                            #to push the number into the address (which would have been initialized as @address = []: @address << new_number
    @address = address 
  end

  def save
    @@all_addresses << self
  end

  def remove_address(address)
    @addresses.delete(address)
  end
end