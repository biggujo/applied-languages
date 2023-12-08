# Modules declaration
# They can be used multiple times in different classes
module UtilityModule
  def some_info_about_class
    puts "Current class name: #{self}"
  end
end

module ActionModule
  def move
    puts "#{self} does some move"
  end
end

class Pawn
  # Make an "extend" and use methods from a module on a class
  extend UtilityModule

  # Make an "include" and use methods from a module on instances
  include ActionModule

  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Person
  # Make an "extend" and use methods from a module on a class
  extend UtilityModule

  # Make an "include" and use methods from a module on instances
  include ActionModule

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Use utility module's method on classes
Person.some_info_about_class
Pawn.some_info_about_class

# Use action methods on instances
# These classes does not go from a so-called "common ancestor",
# but both can use methods from a module
mike = Person.new("Mike")
mike.move

pawn = Pawn.new("Black")
pawn.move