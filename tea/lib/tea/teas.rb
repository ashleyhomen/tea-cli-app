class Teas
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
  end

  def self.list_by_type(input)
    self.all.each.with_index(1) { |t, i| print_tea_card(t, i) if t.type == input}
  end

  def self.list_by_country(input)
    self.all.each.with_index(1) { |t, i| t.print_tea_card(t, i) if t.info.include?(input)}
  end

  def self.print_tea_card(t, i)
    puts "#{i}. Name: #{t.name}"
    puts "      AKA:  #{t.aka}" if t.aka != ""
    puts "      Type: #{t.type}"
    puts "      Info: #{t.info}"
    puts "------------------------"
  end
end
