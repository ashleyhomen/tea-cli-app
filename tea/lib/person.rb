class Person
attr_reader @name

@@all = []

 def initialize(name)
   @name = name
   @cupboard = {:white => [], :green => [], :yellow => [], :oolong => [], :black => [], :puerh => []}
   @@all << self
 end

end 
