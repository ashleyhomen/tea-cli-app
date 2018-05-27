class Session

  attr_accessor :name

  def call
    greeting
    menu
  end

  def greeting
    puts "   Welcome Teahead!"
    puts "   Please enter your name:"
    @name = gets.strip.capitalize
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "   Hello #{@name}"
  end

  def menu
    self.class.request_input("number")
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    self.class.main_menu
    input = nil
    Importer.scrape_teas
    while input != "exit"
      input = gets.strip.to_s.downcase
      if input == "menu"
        self.class.main_menu
      elsif input == "1"
        Teas.list_a_to_z
      elsif input == "2"
        submenu(Teas::TEA_TYPES, "type")
      elsif input == "3"
        submenu(Teas::COUNTRIES, "country")
      elsif input == "exit"
        goodbye
      else
        puts "sorry, I didn't get that..."
        request_input("number")
        self.class.main_menu
      end
    end
  end

  def goodbye
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "   Goodbye #{@name}!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def submenu(list, item_type)
    input = nil
    until valid_input?(list, input)
      self.class.request_input(item_type)
      list.each {|item| puts item}
      input = gets.strip.capitalize
    end
    Teas.list_by(item_type, input)
  end

  def valid_input?(list, input)
    list.include?(input)
    binding.pry
  end

  def self.main_menu
    puts ""
    puts "   1. List all teas"
    puts "   2. List teas by type"
    puts "   3. List teas by country"
    puts "   To exit this sisseion enter: exit"
  end

  def self.request_input(item_type)
    puts "   Please enter a #{item_type} from the list."
  end
end
#  ./bin/teahead
