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
    learn_more_message
  end

  def self.list_by_type
    puts "What type of tea would you like to see?"
    TEA_TYPES.each {|type| puts type}
    input = gets
    self.all.each.with_index(1) { |t, i| print_tea_card(t, i) if t.type == input}
    learn_more_message
  end

  def self.list_by_country(input)
    puts "Enter a country from the list"
    COUNTRIES.each {|country| puts country}
    input = gets
    self.all.each.with_index(1) { |t, i| t.print_tea_card(t, i) if t.info.include?(input)}
    learn_more_message
  end

  def self.print_tea_card(t, i = nil)
    puts "#{i}." if i != nil
    puts "    Name: #{t.name}"
    puts "    AKA:  #{t.aka}" if t.aka != ""
    puts "    Type: #{t.type}"
    puts "    Info: #{t.info}"
    puts "------------------------"
  end

  def self.learn_more
    puts "To learn more about a tea enter the index number"
    puts "To return to the main menu enter: menu"
    input = gets.to_i
    if (1..all.size) === input
      Importer.scrape_tea_profile(all[input - 1])
      print_tea_card(all[input - 1])
    else
      list_options
    end
  end
end
