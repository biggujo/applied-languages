# Утилітарний модуль
module UtilityModule
  def self.something_important
    puts "Something important"
  end

  def self.another_important(parameter)
    puts "Another important: #{parameter}"
  end
end

# Виклик методів прямо на модулі
# Маємо аналог утилітарного класу
UtilityModule.something_important
UtilityModule.another_important "lorem ipsum"

# Модулі для розширення класу
module TestModule
  def say_hello
    puts "Hello"
  end
end

class Animal
  # Підключення методів модулю у вигляді методів екземпляру
  include TestModule

  # Підключення методів модулю у вигляді методів класу
  # extend TestModule

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # У випадку конфлікту імен між класом та модулем, виконується метод з класу
  # def say_hello
  #   puts "Hello, #{@name}"
  # end
end

animal = Animal.new "Bob"

# Виклик на екземплярі
# Спрацює, коли модуль підключається через include
# animal.say_hello

# Виклик на класі
# # Спрацює, коли модуль підключається через extend
Animal.say_hello