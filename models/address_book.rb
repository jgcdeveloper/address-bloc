require_relative 'entry'

  class AddressBook

    attr_reader :entries

    def initialize
      @entries = []
    end


    def add_entry(name, phone_number, email)
      index = 0
      entries.each do |entry|
        if name < entry.name
          break
        end
        index += 1
      end
      entries.insert(index, Entry.new(name, phone_number, email) )
    end

    ## Note try to refactor to not mutate array during loop
    
    def remove_entry(name, phone_number, email)
      index = 0
      entries.each do |entry|
        if (entry.name == name && entry.phone_number == phone_number && entry.email == email)
          entries.delete_at(index)
          break
        end
        index += 1
      end
    end

  end
