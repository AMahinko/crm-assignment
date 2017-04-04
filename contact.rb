class Contact

  @@contacts_list = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)

    @id = @@id
    @@id += 1
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

  end

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)

    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts_list << new_contact
    return new_contact

  end

  # This method should return all of the existing contacts
  def self.all
    return @@contacts_list

  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(query)
    @@contacts_list.each do |contact|
      if contact.id == query
        return contact
      end
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(target, value)
    case
    when "first_name"
      @first_name = value
      return @first_name
    when "last_name"
      @last_name = value
      return @last_name
    when "email"
      @email = value
      return @email
    when "note"
      @note = value
      return @note
    else puts "INPUT ERROR, INVALID TARGET"
    end
  #   if target=="first_name"
  #     @first_name = value
  #     return @first_name
  #   elsif target == "last_name"
  #     @last_name = value
  #     return @last_name
  #   elsif target == "email"                                  <<<< MAKE SURE TO CHANGE M's back to N's if you ever decide to uncomment this.
  #     @email = value
  #     return @email
  #   elsif target == "note"
  #     @mote = value
  #     return @mote
  #   else puts "INPUT ERROR, INVALID TARGET"
  #   end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(target, query)


    @@contacts_list.find do |contact|                                    #<<<final refactor
      contact.send(target) == query
    end

    # @@contacts_list.each do |contact|                                             <<<Refactor one
    #   case target
    #   when "first_name"
    #     return contact if query == contact.first_name
    #   when "last_name"
    #     return contact if query == contact.last_name
    #   when "email"
    #     return contact if query == contact.email
    #   when "note"
    #     return contact query == contact.note
    #   end
    # end
  end
      # if target=="first_name"                                     <-----Attempt one
      #   if query == contact.first_name
      #     return contact
      #   end
      #
      # elsif target=="last_name"
      #   if query == contact.last_name
      #     return contact
      #   end
      #
      # elsif target=="email"
      #   if query == contact.email
      #     return contact
      #   end
      #
      # elsif target=="note"
      #   if query == contact.note
      #     return contact
      #   end
      #
      # else
      #   puts "NOT FOUND"
      #   return nil
      # end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts_list.delete(Contact.find(@id))
  end

  # Feel free to add other methods here, if you need them.

end

x = Contact.create(1,1,1,1)
y = Contact.create(2,2,2,2)
