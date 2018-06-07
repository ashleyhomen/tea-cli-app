require_relative './concerns'
class Teas
  extend Concerns::Menus
  extend Concerns::Messages
  attr_accessor :name, :aka, :type, :info, :url, :notes, :origin, :gongfu_instructions, :western_instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_a_to_z
    self.all.each.with_index(1) { |t, i| print_tea_card(t, i)}
    get_details_message
    learn_more(self.all)
  end

  def self.list_by_type(input)
    tea_array = self.all.select { |tea| tea.type.include?(input)}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    get_details_message
    learn_more(tea_array)
  end

  def self.find_by_name
    puts "Please enter a tea name"
    input = gets.strip.downcase
    tea_array = self.all.select {|obj| obj.name.downcase.include?(input) || obj.aka.downcase.include?(input)}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    get_details_message
    learn_more(tea_array)
  end

  def self.search
    puts "Enter a phrase or word you would like to search for?"
    input = gets.strip.downcase
    tea_array = self.all.select {|obj| obj.name.downcase.include?(input) || obj.aka.downcase.include?(input) || obj.type.downcase.include?(input) || obj.info.downcase.include?(input)}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    get_details_message
    learn_more(tea_array)
  end

  def self.print_tea_card(t, i)
    puts "______________________________________________________________________"
    puts "#{i}."
    puts "    Name: #{t.name}"
    puts "    AKA:  #{t.aka}" if t.aka != ""
    puts "    Type: #{t.type}"
    puts "______________________________________________________________________"
  end

  def self.learn_more(array)
    input = nil
    while input != "menu"
    input = gets.strip
      if (1..array.size) === input.to_i
        if array[input.to_i - 1].origin == nil
          Importer.scrape_tea_profile(array[input.to_i - 1])
        end
        print_tea_profile(array[input.to_i - 1])
        see_more_message(array.size)
      elsif input == "list"
        array.each.with_index(1) {|t, i| print_tea_card(t, i)}
        get_details_message
      elsif input == "menu"
        nil
      else
        invalid_input_message(array.size)
      end
    end
    main_menu
  end

  def self.print_tea_profile(obj)
    puts "______________________________________________________________________"
    puts ""
    puts "    NAME: #{obj.name}"
    puts "    AKA:  #{obj.aka}" if obj.aka != ""
    puts "    TYPE: #{obj.type}"
    puts "    ORIGIN: #{obj.origin}"
    puts ""
    puts "    INFO:"
    puts "       #{obj.info}"
    puts ""
    puts "    TASTING NOTES:" if obj.notes != []
    obj.notes.pop
    obj.notes.each do |note|
      n = note.split(/\n/).delete_if(&:empty?)
      puts "       #{n[0]}: #{n[1]}"
    end
    puts ""
    if obj.gongfu_instructions[:first_infusion] != nil
      puts "    GONGFU STEEPING INSTRUCTIONS:"
      obj.gongfu_instructions.each { |k, v| puts "       #{k.to_s.upcase.gsub("_"," ")}: #{v.gsub("    ","")}"}
      puts ""
    end
    if obj.western_instructions[:first_infusion] != nil
      puts "    WESTERN STEEPING INSTRUCTIONS:"
      obj.western_instructions.each { |k, v| puts "       #{k.to_s.upcase.gsub("_"," ")}: #{v.gsub("    ","")}"}
    end
    puts "______________________________________________________________________"
  end
end
