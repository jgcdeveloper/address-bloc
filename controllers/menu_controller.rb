require_relative '../models/address_book'

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
   end

   def create_entry
   end

   def search_entries
   end

   def read_csv
   end

 end
