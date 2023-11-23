class Person
  ["name", "age"].each do |parameter|
    # Створення методу за переданою назвою
    define_method(parameter) do
      # Тут можлива складніша логіка
      # Наприклад, запит до БД
      puts "Calling '#{parameter}'"
    end
  end

  def method_missing(name, *args, &block)
    puts "Method '#{name}' does not exist. Creating it..."

    # Аналогічне створення
    define_singleton_method(name) do |*args|
      puts "Calling newly created '#{name}' method"

      puts "Some business logic here"
      puts "Arguments:"

      # Перебір аргументів
      args.each do |arg|
        puts "Arg: #{arg}"
      end
    end

    # Виклик щойно створеного методу
    self.send(name, *args, &block)
  end
end

jack = Person.new

# Працює
puts jack.name
puts jack.age

# Метод для одного екземпляру
jack.define_singleton_method("say_hello") do
  puts "Hello, World!"
end

# Працює
jack.say_hello

# Динамічне створення
jack.language "lorem ipsum", 12

mary = Person.new

# Також працює
puts mary.name
puts mary.age

# Якщо виключити method_missing, то матимемо помилку виклику
begin
  mary.say_hello
rescue NoMethodError => e
  puts e
end

# Ще одне створення методу
mary.gender