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
    puts ""
    list_options
    input = nil

    while input != "exit"
      input = gets.strip.downcase
      if input == "list"
        list_options
      elsif input == "all"
        Teas.list_a_to_z
      elsif input == "type"
        Teas.list_by_type(type)
      elsif input == "country"
        Teas.list_by_country(country)
      elsif input == "exit"
        puts "Goodbye #{@name}!"
      else
        puts "Sorry, I didn't get that... Please enter command again"
        list_options
      end
    end
  end

  def list_options
    puts "   1. To list teas alphabetically enter: all"
    puts "   2. To list teas by type enter: type"
    puts "   3. To list teas by country enter: country"
  end
end
#  ./bin/teahead
