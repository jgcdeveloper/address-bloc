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
     puts "5 - View Entry Number #"
     puts "6 - Exit"
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
           system "clear"
           view_entry_number
           main_menu
        when 6
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

   def search_entries

   end

   def read_csv

   end

   def view_entry_number
      print "Which entry do you wish to view?: "
      entrynum = gets.chomp

      #check if our number is an integer, if so accept, if not prompt for another number
      begin
      number = Integer(entrynum)
         rescue ArgumentError
            puts "Invalid Number... Press a key to continue"
            STDIN.getch
            system "clear"
            view_entry_number
      end

      puts "You selected to see entry number #{number}. Press a key to continue"
      STDIN.getch
      system "clear"
      main_menu
      
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
         when "e"
         when "m"
           system "clear"
           main_menu
         else
           system "clear"
           puts "#{selection} is not a valid input"
           entry_submenu(entry)
       end

   end

 end
