require "./contact.rb"

class CRM < Contact

  def initialize

  end

  # def update(target, value)
  #   super(target,value)
  # end

  def main_menu
    while true
      print_main_menu
      user_selection=gets.to_i
      call_option(user_selection)
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"

  end

  def call_option(user_selection)
    case user_selection
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
    end

  end

  def add_new_contact
  print "Input first name: "
  first_name = gets.chomp

  print "Input last name: "
  last_name = gets.chomp

  print "Input email: "
  email = gets.chomp

  print "Input note: "
  note = gets.chomp

  Contact.create(first_name, last_name, email, note)

  end

  def modify_existing_contact
    puts "Input contact to modify(by ID)"
    targetid = gets.chomp.to_i
    puts targetid
    puts "Input value to modify"
    target_catagory = gets.chomp
    puts target_catagory
    target = Contact.find(targetid)
    puts target.inspect
    puts "Input a new value."
    value = gets.chomp
    return target.update(target_catagory, value)
  end

  def delete_contact
    puts "Input target for deletion"
    targetid = gets.chomp.to_i
    Contact.find(targetid).deleter

  end

  def display_all_contacts
    puts Contact.all.inspect

  end

  def search_by_attribute
    puts "Input catagory"
    target = gets.chomp
    puts "Input value"
    query = gets.chomp



  end


end

x = CRM.new
x.main_menu
