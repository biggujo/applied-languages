class Gladiator
  attr :name

  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Hello, #{@name}"
    yield(name)
  end
end

gladiator = Gladiator.new("Gladiator")

gladiator.say_hello { |name| puts "My name is #{name}" }