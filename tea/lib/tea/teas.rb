class Teas
  attr_accessor :type, :name, :aka, :steep_time, :steep_temp, :country

  @@all = []

  def initialize(type = rand(1..6), name = rand(a..z), time = 120, temp = 212)
    @type = type
    @name = name
    @steep_time = time
    @steep_temp = temp
    @@all << self
  end

  def self.obj_create
    puts "calls obj create"
    self.new
  end

  def self.a_to_z
    puts "calls a to z"
    az = []
    az << @@all.sort
    az.each.with_index(1) { |t, i| puts "  #{i}. #{t.name}"}
  end

  def self.list_by_tea_type(type)
    puts "calls lists by tea type"
    Importer.new(type).scrape_teas
  end
end
