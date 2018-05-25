class Teas
  attr_accessor :type, :name, :info, :url, :notes, :gongfu_instructions, :western_instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_a_to_z
    az = @@all.sort_by {|obj| obj.name}
    az.each.with_index(1) do |t, i|
      puts "#{i}. #{t.name}"
      puts "      #{t.type}"
      puts "      #{t.info}"
      puts "--------------------------"
  end

  def self.list_by_type(input)
    az = @@all.collect {|obj| obj.type == input}
    az.each.with_index(1) do |t, i|
    puts "#{i}. #{t.name}"
    puts "      #{t.info}"
    puts "--------------------------"
  end

  def self.list_by_country(input)
    az = @@all.collect {|obj| obj.notes.include?(input)}
    az.each.with_index(1) do |t, i|
    puts "#{i}. #{t.name}"
    puts "      #{t.type}"
    puts "      #{t.info}"
    puts "--------------------------"
  end
end
