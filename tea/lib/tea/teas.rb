class Teas
  attr_accessor :type, :name, :aka, :steep_time, :steep_temp, :country

  @@all = []

  def initialize(type, name, time, temp)
    @type = type
    @name = name
    @steep_time = time
    @steep_temp = temp
    @@all << self
    puts "#{self}, #{self.name}, #{self.type}"
  end

  def self.all
    @@all
  end

  def self.obj_create_g
    puts "calls obj create"
    type = "green"
    name = "Gunpowder"
    time = 120
    temp = 170
    puts "Type: #{type}, Name: #{name}, Time: #{time}, Temp: #{temp}"
    self.new(type, name, time, temp)
  end

  def self.obj_create_b
    puts "calls obj create"
    type = "black"
    name = "ruby"
    time = 150
    temp = 200
    puts "Type: #{type}, Name: #{name}, Time: #{time}, Temp: #{temp}"
    new(type, name, time, temp)
  end

  def self.a_to_z
    puts "calls a to z"
    az = @@all.sort_by {|obj| obj.name}
    az.each.with_index(1) { |t, i| puts "  #{i}. #{t.name}"}
  end

  def self.list_by_tea_type(type)
    puts "calls lists by tea type"
    Importer.new(type).scrape_teas
  end
end
