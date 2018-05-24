class Person
attr_reader :name, :cupboard

@@all = []

 def initialize(name)
   @name = name
   @cupboard = {:white => [], :green => [], :yellow => [], :oolong => [], :black => [], :puerh => []}
   @@all << self
   cupboard
 end

 def cupboard
   @cupboard
 end

 def self.all
   @@all
 end

end

#./tea-cli-app/tea/bin/teahead

#./tea./bin/teahead
