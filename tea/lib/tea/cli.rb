class Session

  attr_accessor :name

  def call
    greeting
    menu
  end

  def greeting
    puts "Welcome Teahead!"
    puts "Please enter your name:"
    @name = gets.strip.capitalize
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "   Hello #{@name}"
  end

  def menu
    puts "   what would you like to do?"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    self.class.list_options
    input = nil
    Importer.scrape_teas
    while input != "exit"
      input = gets.strip.to_s.downcase

      if input == "menu"
        self.class.list_options

      elsif input == "1"
        Teas.list_a_to_z

      elsif input == "2"
        type_submenu

      elsif input == "3"
        puts "Enter a country from the list"
        Teas::COUNTRIES.each {|country| puts country}
        input = gets.strip.downcase
        Teas.list_by_country(input)

      elsif input == "exit"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "   Goodbye #{@name}!"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

      else
        invalid_input("number")
        self.class.list_options

      end
    end
  end

  def type_submenu
    input = nil
    puts "What type of tea would you like to see?"
    Teas::TEA_TYPES.each {|type| puts type}
    until Teas::TEA_TYPES.include?(input)
      puts "Sorry, I didn't get that... Please enter a type from the list."
      input = gets.strip.downcase
    end
    Teas.list_by_type(input) if Teas::TEA_TYPES.include?(input)
  end

  def self.list_options
    puts ""
    puts "   1. List all teas"
    puts "   2. List teas by type"
    puts "   3. List teas by country"
    puts "   To exit this sisseion enter: exit"
  end

  def self.invalid_input(item_type)
    "Sorry, I didn't get that... Please enter a #{item_type} from the list."
  end
end
#  ./bin/teahead
