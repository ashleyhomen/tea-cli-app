module Tea::Concerns

  module Menus
    TEA_TYPES = ["White", "Green", "Yellow", "Oolong", "Black", "Puerh", "Blend", "Tisanes"]

    def request_input(item_type)
      puts "   Please enter a #{item_type} from the list."
    end

    def main_menu
      puts ""
      puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      puts "*                                                                     *"
      puts "*     1. List all teas                                                *"
      puts "*     2. List teas by type                                            *"
      puts "*     3. Find tea by name                                             *"
      puts "*     4. Search by word or phrase                                     *"
      puts "*     To exit this sisseion enter: exit                               *"
      puts "*                                                                     *"
      puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      puts ""
    end

    def type_submenu
      input = nil
      until TEA_TYPES.include?(input)
        request_input("type")
        TEA_TYPES.each {|item| puts "      #{item}"}
        input = gets.strip.capitalize
      end
      puerh_submenu if input == "Puerh"
      Tea::Teas.list_by_type(input) if input != "Puerh"
    end

  def puerh_submenu
    input = nil
    until input == "Ripened" || input == "Raw"
      request_input("type")
      puts "      Raw"
      puts "      Ripened"
      input = gets.strip.capitalize
    end
    Tea::Teas.list_by_type(input)
  end
end

  module Messages

    def invalid_input_message(num)
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "Sorry, I didn't get that!"
      puts "Please enter 1-#{num} or enter: menu"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def get_details_message
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "To learn more about a tea enter the index number"
        puts "To return to the main menu enter: menu"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end

    def see_more_message(num)
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts "To see another profile enter: 1-#{num}"
      puts "To return to the list enter: list"
      puts "To return to the main menu enter: menu"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    end
  end
end
