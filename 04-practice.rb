# module TestModule
#   def hello
#     "Hello, I am #{self}"
#   end
#
#   def show_methods
#     "#{self.methods.sort}"
#   end
# end
#
# class Person
#   include TestModule
#
#   def self.about_me
#     puts self.inspect
#   end
#
#   attr_accessor :name
#
#   def initialize(name)
#     self.name = name
#   end
#
#   def hello
#     "Hello, #{self.name}"
#   end
#
#   def about_me
#     puts self.inspect
#   end
#
#   def analyze_class
#     puts self.class.about_me
#   end
#
#   @@class_var = "Some class var"
#
#   def self.print_class_var
#     puts @@class_var
#   end
# end
#
# artem = Person.new "artem"
#
# puts artem.hello
# artem.about_me
# Person.about_me
#
# artem.analyze_class
#
# Person.print_class_var
#
# puts artem.show_methods

class Animal
  class << self
    def some_class_method
      "Hello, World!"
    end
  end
end

module SomeModule
  class << self
    def some_class_method
      "Hello, World!"
    end
  end
end