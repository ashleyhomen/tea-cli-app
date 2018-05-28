module Concerns

  module Menus
    TEA_TYPES = ["White", "Green", "Yellow", "Oolong", "Black", "Puerh"]
    COUNTRIES = ["China", "Japan", "Taiwan"]

    def request_input(item_type)
      puts "   Please enter a #{item_type} from the list."
    end

    def valid_input?(list, input)
      list.include?(input) || input == "menu"
    end

    def main_menu
      puts ""
      puts "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
      puts "*                                                                     *"
      puts "*     1. List all teas                                                *"
      puts "*     2. List teas by type                                            *"
      puts "*     3. Find tea by name                                             *"
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
      Teas.list_by_type(input)
    end

    def country_submenu
      input = nil
      until TEA_TYPES.include?(input)
        request_input("country")
        COUNTRIES.each {|item| puts "      #{item}"}
        input = gets.strip.capitalize
      end
      Teas.list_by_country(input)
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

  module Findables
    def find_by_name
      input = gets.downcase
      self.all.detect{ |obj| obj.name == input}
    end
end
