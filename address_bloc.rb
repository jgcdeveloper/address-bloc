require_relative 'controllers/menu_controller'

# This will create a new instance of Menu Controller locally
menu = MenuController.new

# This will clear the command line
system "clear"

# This prints a message to our screen with a newline after
puts "Welcome to AddressBloc!"

# This will call the main menu stored in our MenuController
menu.main_menu
