class Tea

  def self.welcome_message
    puts "Enter your name Teahead!"
    name = gets
    Person.new(name)
  end

  def self.list_menu
    puts "1. List my teas"
    puts "2. List all teas"
  end

end
