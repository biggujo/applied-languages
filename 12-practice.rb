class Dog
  def initialize(name)
    @name = name
  end
end

dog1 = Dog.new("dog1")

def dog1.abc
  puts "Singleton method"
end

dog1.abc

dog2 = Dog.new("dog2")

dog2.abc # NoMethodError