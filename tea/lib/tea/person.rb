class Person
attr_accessor :name, :cupboard

@@all = []

 def initialize(name)
   @name = name
   @cupboard = {:white => [], :green => [], :yellow => [], :oolong => [], :black => [], :puerh => []}
 end

 def cupboard
   @cupboard
 end

 def self.all
   @@all
 end

 def self.find_by_name(name)
   @@all.detect{ |person| person.name == name}
 end

 def self.create_by_name(name)
   new_person = self.new(name)
   @@all << new_person
 end

 def self.find_or_create_by_name(name)
   find_by_name(name) || create_by_name(name)
 end

end

#./tea-cli-app/tea/bin/teahead

#./tea./bin/teahead
