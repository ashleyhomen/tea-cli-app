class Session

  attr_accessor :me

  def call
    greeting
    menu
  end

  def greeting
    puts "Welcome Teahead!"
    puts "Please enter your name:"
    name = gets.strip.capitalize
    find_me(name)
  end

  def find_me(name)
    @me = Person.find_or_create_by_name(name)
    puts "#{@me}"
  end

  def menu
    puts ""
    puts "what would you like to do?"
    puts ""
    list_options
    input = nil

    while input != "exit"
      input = gets.strip.downcase

      if input == "list"
        list_options

      elsif input == "test"
        Teas.obj_create_g
        Teas.obj_create_b

      elsif input == "all"
        Importer.scrape_teas(input)
        Teas.a_to_z

      elsif input == "type"
        puts "What type of tea would you like to see?"
        list_types
        type = gets
        Importer.scrape_teas(type)
        Teas.list_by_tea_type(type)

      elsif input == "country"
        puts "Enter a country from the list"
        list_countries
        country = gets
        Importer.scrape_teas(country)
        Teas.list_by_tea_country(country)

      elsif input == "exit"
        nil
      else
        puts "Sorry, I didn't get that"
        list_options
      end
    end
  end

  def list_options
    puts "   1. To list teas alphabetically enter: all"
    puts "   2. To list teas by type enter: type"
    puts "   3. To list teas by country enter: country"
  end

  def list_types
    puts "   White"
    puts "   Green"
    puts "   Yellow"
    puts "   Oolong"
    puts "   Black"
    puts "   Puerh"
  end

  def list_countries
    puts "   China"
    puts "   Japan"
    puts "   Taiwan"
  end

end
#  ./bin/teahead
