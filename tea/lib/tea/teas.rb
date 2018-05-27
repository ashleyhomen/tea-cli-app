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
    tea_array = self.all.collect { |tea| tea.notes.include?(input.capitalize)}
    tea_array.each.with_index(1) { |t, i| print_tea_card(t, i)}
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
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "To learn more about a tea enter the index number"
    puts "To return to the main menu enter: menu"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    input = nil
    while input != "menu"
    input = gets.strip
      if (1..array.size) === input.to_i
        Importer.scrape_tea_profile(array[input.to_i - 1])
        print_tea_profile(array[input.to_i - 1])
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "To see another profile enter: 1-#{array.size}"
        puts "To return to the main menu enter: menu"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      elsif input == "menu"
        nil
      else
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Sorry, I didn't get that!"
        puts "Please enter 1-#{array.size} or enter: menu"
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      end
    end
    Session.list_options
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
