# A base complete class uses is_alive?
class Animal
  attr_reader :name

  def initialize(name, is_alive)
    @name = name
    @is_alive = is_alive
  end

  def eat
    puts "#{@name} eats"
  end

  # This method is available only in Animal class and its descendants
  def is_alive?
    @is_alive
  end
end

# A child class
class Dog < Animal
  # A need of initializing all fields
  def initialize(name, is_alive)
    # Usage of super calls the parent initialize(name, is_alive)
    super(name, is_alive)
  end
end

# Another class uses is_alive? too
class Person
  attr_reader :name

  def initialize(name, is_alive)
    @name = name
    @is_alive = is_alive
  end

  def study
    puts "#{@name} is studying"
  end

  # This method is available only in Person class and its descendants
  def is_alive?
    @is_alive
  end
end

jack = Dog.new("Jack", true)

# All methods from a parent is available in a child
jack.eat
puts "Is #{jack.name} alive: #{jack.is_alive?}"

andrew = Person.new("Andrew", true)

puts "Is #{andrew.name} alive: #{andrew.is_alive?}"