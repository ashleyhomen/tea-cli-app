class Session

  attr_accessor :name

  def call
    Importer.scrape_teas
    greeting
    menu
  end

  def greeting
    puts "Welcome Teahead!"
    puts "Please enter your name:"
    @name = gets.strip.capitalize
    puts ""
    puts "Hello #{@name}"
  end

  def menu
    puts "what would you like to do?"
    list_options
    input = nil

    while input != "exit"
      input = gets.strip.to_s.downcase
      if input == "menu"
        list_options
      elsif input == "1"
        Teas.list_a_to_z
      elsif input == "2"
        Teas.list_by_type(type)
      elsif input == "3"
        Teas.list_by_country(country)
      elsif input == "exit"
        puts "Goodbye #{@name}!"
      else
        puts "Sorry, I didn't get that... Please enter a number from the list."
        list_options
      end
    end
  end

  def list_options
    puts ""
    puts "   1. List all teas"
    puts "   2. List teas by type"
    puts "   3. List teas by country"
    puts "To exit this sisseion enter: exit"
  end
end
#  ./bin/teahead
