class Person
  # Метод класу
  def self.say_something
    puts "Some text from the Person class."
    return "Some return from Person.say_something"
  end

  def initialize(name)
    @name = name
  end

  # Метод екземпляру з параметром
  def say_hello(greeting)
    # Можливість доступу до змінної класу
    puts "#{greeting}, #{@name}"
  end
end

puts Person.say_something # Виклик методу класу з return, що повертає рядок
person = Person.new("Jane")
person.say_hello("Hello") # Виклик методу екземпляру з параметром