require_relative './concerns'
class Session
  include Concerns::Menus
  attr_accessor :name

  def call
    greeting
    hub
    goodbye
  end

  def greeting
    puts "   Welcome Teahead!"
    puts "   Please enter your name:"
    @name = gets.strip.capitalize
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "   Hello #{@name}"
  end

  def hub
    request_input("number")
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    main_menu
    input = nil
    Importer.scrape_teas
    while input != "exit"
      input = gets.strip.to_s.downcase
      if input == "menu"
        main_menu
      elsif input == "1"
        Teas.list_a_to_z
      elsif input == "2"
        type_submenu
      elsif input == "3"
        country_submenu
      elsif input == "exit"
        nil
      else
        puts "sorry, I didn't get that..."
        request_input("number")
        main_menu
      end
    end
  end

  def goodbye
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "   Goodbye #{@name}!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end
end
#  ./bin/teahead
