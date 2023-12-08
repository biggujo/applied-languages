# Declaring a storage of methods can be reused in different classes
module CreaturesModule
  def die
    unless @is_alive
      puts "#{@name} is already dead"
    end

    puts "#{@name} dies"
    @is_alive = false
  end

  def get_happy
    "#{@name} is happy"
  end
end

module InfoModule
  def print_class_name
    puts "Class name: ##{self.name}"
  end
end

# Base complete classes
class Animal
  # Include as instance methods
  include CreaturesModule

  # Include as a class methods
  extend InfoModule

  attr_reader :name, :is_alive

  def initialize(name, is_alive)
    @name = name
    @is_alive = is_alive
  end

  def eat
    puts "#{@name} eats"
  end
end

# Another class
class Person
  # Include as instance methods
  include CreaturesModule

  # Include as a class methods
  extend InfoModule

  attr_reader :name, :is_alive

  def initialize(name, is_alive)
    @name = name
    @is_alive = is_alive
  end
end

animal = Animal.new("Example animal", true)
puts "Is #{animal.name} alive: #{animal.is_alive}"

# Reusage of method class in different classes
# without explicit declaration of such methods above
animal.die

puts "Is #{animal.name} alive: #{animal.is_alive}"

andrew = Person.new("Andrew", true)

# Same reusage
andrew.get_happy

# Implementation of DRY: each of classes does not explicitly declare such class method
# They just use "extend" from module and run as is
Animal.print_class_name
Person.print_class_name