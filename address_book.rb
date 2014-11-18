
require './lib/contact'
require './lib/address'


@current_person = nil

def main_menu

  puts "Press 'a' to add a new person. Press 'l' to list all contacts. Press 'x' to exit"
  input = gets.chomp

  if input == "x"
    exit
  elsif input == "a"
    puts "First Name"
    @first_name = gets.chomp
    puts  "Last Name"
    @last_name = gets.chomp
    @current_person = Contact.new(@first_name, @last_name)
    @current_person.save
    add_address

  elsif input == "l"
    Contact.all.each do |person|
      puts person.first_name +  " " + person.last_name
    end
    puts "\n"
    puts "Choose a contact to view all details"
    @selected_contact = gets.chomp

    show_contact_details
end

  main_menu
end

def add_address
  puts "Please enter the address for '#{@current_person}"
  address_entry = gets.chomp
  new_address = Address.new(address_entry)
  new_address.save
  @current_person.push_address(new_address)
end


def show_contact_details
  Contact.all.each do |person|  #loop performed on each element in the Contact class method, which includes the class variable
    if @selected_contact == person.first_name + " " +  person.last_name
      puts "\n"
      puts person.first_name + " " + person.last_name
      person.addresses.each do |address|  #loop performed on each address, from the addresses method in contacts 
        puts address
      end
      puts "If you would like to update contact details, press 1"
      puts "Press 'm' to get back to the main menu"
      edit_choice = gets.chomp
      if edit_choice == "m"
        main_menu  
      elsif edit_choice == "1"
        puts "Press 'a' to add a new address or 'd' to delete one."
        address_update = gets.chomp
        if address_update == 'a'
          add_address
        elsif address_update == 'd'
          count = 0
          @current_person.addresses.each do |address_array|
            puts count.to_s + ") " + address_array.full_address
            count += 1
          end
          puts "Press the number of the address you would like to delete."
          delete_address = gets.chomp
          @current_person.addresses.delete_at(delete_address.to_i)
        end
      end
    end
  end
end
