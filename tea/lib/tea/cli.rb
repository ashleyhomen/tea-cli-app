require_relative './concerns'
class Tea::Session
  include Tea::Concerns::Menus
  include Tea::Concerns::Messages
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
    puts "   Hello #{@name}!"
    request_input("number")
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def hub
    main_menu
    input = nil
    Tea::Importer.scrape_teas
    while input != "exit"
      input = gets.strip.to_s.downcase
      if input == "menu"
        main_menu
      elsif input == "1"
        Tea::Teas.list_a_to_z
      elsif input == "2"
        type_submenu
      elsif input == "3"
        Tea::Teas.find_by_name
      elsif input == "4"
        Tea::Teas.search
      elsif input == "exit"
        nil
      else
        invalid_input_message(4)
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
