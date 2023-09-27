module TestModule
  def say_big_bark
    "BARK! (from module)"
  end
end

class Animal
  def initialize(name)
    @name = name
  end

  def say_hello
    "Hello, #{@name}"
  end

  SOME_CONST = 123
end

class Dog < Animal
  include TestModule

  def initialize(name, age)
    super(name)
    @age = age
  end

  def bark
    "Bark! (I am #{@name}, #{@age} y.o.)"
  end

  def test
    SOME_CONST
  end
end

dog = Dog.new "a", 12

puts dog.bark
puts dog.test
puts dog.say_big_bark