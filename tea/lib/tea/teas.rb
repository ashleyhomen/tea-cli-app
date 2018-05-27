require_relative './concerns'
class Teas
  extend Concerns::Menus
  extend Concerns::Messages
  attr_accessor :name, :aka, :type, :info, :url, :notes, :gongfu_instructions, :western_instructions

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
    tea_array = self.all.select { |tea| tea.type == input}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
    get_details_message
    learn_more(tea_array)
  end

  def self.list_by_country(input)
    tea_array = self.all.select { |tea| tea.notes.include?(input)}
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
        Importer.scrape_tea_profile(array[input.to_i - 1])
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
    puts ""
    puts "    INFO:"
    puts "       #{obj.info}"
    puts ""
    puts "    TASTING NOTES:"
    obj.notes.each do |note|
      n = note.split(/\n/)
      puts "    #{n[1]}: #{n[2]}"
    end
    puts ""
    puts "    GONGFU STEEPING INSTRUCTIONS:"
    obj.gongfu_instructions.each { |k, v| puts "       #{k.to_s.split("_").join(" ")}: #{v}"}
    puts ""
    puts "    WESTERN STEEPING INSTRUCTIONS:"
    obj.western_instructions.each { |k, v| puts "       #{k.to_s.split("_").join(" ")}: #{v}"}
    puts "______________________________________________________________________"
  end
end
