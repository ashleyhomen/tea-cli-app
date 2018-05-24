class Session

  attr_accessor :me

  def call
    greeting
    menu
  end

  def greeting
    puts "Welcome Teahead!"
    name = gets.strip.capitalize
    puts "your name is: " + name
    find_me(name)
  end

  def find_me(name)
    @me = Person.find_or_create_by_name(name)
    puts "#{@me}"
  end

  def cupboard
    self.me.cupboard
  end

  def menu
    puts ""
    puts "what would you ike to do?"
    puts ""
    list_options
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input == "list"
        list_options
      elsif input == "cupboard"
        puts "#{self.me.cupboard}"
      elsif input == "all"
        puts "Teas a-z"
      elsif input == "type"
        puts "Teas by type"
      elsif input == "country"
        puts "Teas by country"
      else
        puts "Sorry, I didn't get that"
        list_options
      end
    end
  end

  def list_options
    puts "To list teas alphabetically enter: all"
    puts "To list teas by type enter: type"
    puts "To list teas by country enter: country"
  end

end

#  ./bin/teahead
