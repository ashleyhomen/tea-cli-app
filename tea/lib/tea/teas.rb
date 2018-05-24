class Tea
  attr_accessor :type, :name, :aka, :steep_time, :steep_temp

  @@all = []

  def initialize(type, name, time = default_time, temp = default_temp)
    @type = type
    @name = name
    @steep_time = time
    @steep_temp = temp
    @@all << self
  end

end 
