class Contact

@@all_contacts = []

  def Contact.all
  	@@all_contacts
  end

  def initialize(first_name, last_name)
	@first_name = first_name
	@last_name = last_name
	@addresses = []
  end

  def first_name
	 @first_name 
  end

  def last_name
	 @last_name 
  end

  def addresses
  	@addresses
  end

  def push_address(new_address)
  	@addresses << new_address
  end

  def save
  	@@all_contacts << self   
  end

  def Contact.clear
	@@all_contacts = []
  end

end

#the following is to set an example:

John = Contact.new("John", "Smith")

John.push_address("7 Main Street, NY, NY 10001")

John.push_address("22 Main Street, NY, NY 10002")

test = John.addresses

John.addresses.each do |address|
	puts address + "hi"
end #prints each address + the word hi






