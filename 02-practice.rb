# class Person
#   attr_accessor :name, :age
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
#
#   def hello
#     "Hello, #{@name}"
#   end
#
#   def a
#     puts "a"
#   end
#
#   private :a
# end
#
# person = Person.new("abc", 16)
#
# person.name = "John"
# person.age = 14
#
# puts person
# puts person.name
# puts person.age
#
# puts person.hello

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}"
  end
end

class Dog < Animal
  def initialize(name)
    super(name)
  end

  def bark
    "Bark"
  end
end

dog = Dog.new("Dog")

puts dog.bark
puts dog.hello
