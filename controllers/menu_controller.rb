require_relative '../models/address_book'
require 'io/console'

class MenuController
   attr_reader :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     # Note that print does not go to a new line, whereas puts does. Only diff.
     print "Enter your selection: "

     #Gets a selection from the user
     selection = gets.to_i

     #Case based on selectors
     case selection

        when 1
           system "clear"
           view_all_entries
           main_menu
        when 2
           system "clear"
           create_entry
           main_menu
        when 3
           system "clear"
           search_entries
           main_menu
        when 4
           system "clear"
           read_csv
           main_menu
        when 5
           puts "Goodbye!"

           #Tells the program to exit without an error
           exit(0)
        else
           system "clear"
           puts "Sorry... Not a valid selection :()"
           main_menu
     end
   end

   def view_all_entries

      address_book.entries.each do |entry|
         system "clear"
         puts entry.to_s
         entry_submenu(entry)
      end

   end

   def create_entry

      system "clear"

      puts "New AddressBloc Entry!"

      print "Name: "
      name = gets.chomp

      print "Phone number: "
      phone_number = gets.chomp

      print "Email: "
      email = gets.chomp

      address_book.add_entry(name, phone_number, email)

      system "clear"
      puts "New entry created for #{name}, who can be reached at #{phone_number} or #{email}."

      puts "\n\nPress any key to continue!"
      STDIN.getch
      system "clear"

   end

   def delete_entry(entry)
      system "clear"
      address_book.entries.delete(entry)
      puts "#{entry.name} has been deleted"

   end

   def edit_entry(entry)
      print "Updated Name: "
      name = gets.chomp
      print "Updated Phone Number: "
      phone_number = gets.chomp
      print "Updated Email: "
      email = gets.chomp

      entry.name = name if !name.empty?
      entry.phone_number = phone_number if !phone_number.empty?
      entry.email = email if !email.empty?
      system "clear"

      puts "Updated entry: "
      puts entry
      puts "\n\n Press any key to contine"
      STDIN.getch
   end


   def search_entries
      print "Search by name: "
      name = gets.chomp
      match = address_book.binary_search(name)
      system "clear"

      if match
         puts match.to_s
         search_submenu(match)
      else
         puts "No match found for #{name}"
      end
   end

   def read_csv
      print "Enter name of CSV file to import: "
      file_name = gets.chomp

      if file_name.empty?
         system "clear"
         puts "no CSV file read"
         puts "Press any key to return to main menu"
         STDIN.getch
         system "clear"
         main_menu
      end

      begin
         entry_count = address_book.import_from_csv(file_name).count
         system "clear"
         puts "#{entry_count} new entries added from #{file_name}"
      rescue
         puts "#{file_name} is not a valid CSV. Please enter a valid CSV"
         read_csv
      end
   end

   def entry_submenu(entry)
       puts "n - next entry"
       puts "d - delete entry"
       puts "e - edit this entry"
       puts "m - return to main menu"

       selection = STDIN.getch

       case selection
         when "n"
         when "d"
            delete_entry(entry)
         when "e"
            edit_entry(entry)
            entry_submenu(entry)
         when "m"
           system "clear"
           main_menu
         else
           system "clear"
           puts "#{selection} is not a valid input"
           entry_submenu(entry)
       end
   end

   def search_submenu(entry)

      puts"\nd - delete entry"
      puts"e - edit this entry"
      puts"m - return to the main menu"

      selection = gets.chomp

      case selection

      when 'd'
         system "clear"
         print "Are you sure you want to delete #{entry.name}'s entry? <y/n>"
         choice = STDIN.getch

         if choice == 'y'
            delete_entry(entry)
            main_menu
         else
            system "clear"
            puts "Entry not deleted... Press a Key"
            STDIN.getch
            search_submenu(entry)
         end

      when 'e'
         edit_entry(entry)
         system "clear"
         main_menu

      when 'm'
         system "clear"
         main_menu
      end

   end

end
