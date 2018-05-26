class Teas
  attr_accessor :name, :aka, :type, :info, :url, :notes, :gongfu_instructions, :western_instructions
  TEA_TYPES = ["White", "Green", "Yellow", "Oolong", "Black", "Puerh"]
  COUNTRIES = ["China", "Japan", "Taiwan"]

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_a_to_z
    self.all.each.with_index(1) { |t, i| print_tea_card(t, i)}
    learn_more(self.all)
  end

  def self.list_by_type(input)
    tea_array = self.all.select { |tea| tea.type.downcase == input}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    learn_more(tea_array)
  end

  def self.list_by_country(input)
    tea_array = self.all.collect { |tea| tea.note.include?(input.capitalize)}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    learn_more(tea_array)
  end

  def self.print_tea_card(t, i = nil)
    puts "#{i}." if i != nil
    puts "    Name: #{t.name}"
    puts "    AKA:  #{t.aka}" if t.aka != ""
    puts "    Type: #{t.type}"
    puts "    Info: #{t.info}"
    puts "------------------------"
  end

  def self.learn_more(array)
    puts "To learn more about a tea enter the index number"
    puts "To return to the main menu enter: menu"
    input = nil 
    while input != "menu"
    input = gets.to_i
    if (1..array.size) === input
      Importer.scrape_tea_profile(array[input - 1])
      print_tea_card(array[input - 1])
    else
      puts "Sorry, I didn't get that!"
      puts "Please enter 1-#{array.size} or enter: menu"
    end
    Session.list_options
  end
end
