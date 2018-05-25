class Teas
  attr_accessor :type, :name, :info, :url, :notes, :gongfu_instructions, :western_instructions

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.a_to_z
    puts "Importing all teas"
    Importer.scrape_teas("all")
    az = @@all.sort_by {|obj| obj.name}
    az.each.with_index(1) do |t, i|
      puts "#{i}. #{t.name}"
      puts "      #{t.type}"
      puts "      #{t.info}"
      puts "--------------------------"
  end

  def self.list_by_tea_type(oxidation)
    puts "Importing #{oxidation} teas"
    Importer.scrape_teas(oxidation)
    az = @@all.collect {|obj| obj.type == oxidation}
    az.each.with_index(1) do |t, i|
    puts "#{i}. #{t.name}"
    puts "      #{t.info}"
    puts "--------------------------"
  end
end
