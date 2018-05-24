class Session

  attr_accessor :me

  def call
    greeting
    menu

  end



  def greeting
    puts "Welcome Teahead!"
    name = gets
    puts "your name is: " + name
    me(name)
  end

  def me(name)
    @me = Person.new(name)
  end

  def cupboard
    self.me.cupboard
  end

  def menu
    puts "1. List my teas"
    puts "2. List all teas"
  end

end

#  ./bin/teahead
