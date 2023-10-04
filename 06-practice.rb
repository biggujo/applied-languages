require 'json'
require './06-module'

x = { a: 1, b: 2 }

# puts x.to_json

class Test
  include TestModule

  def initialize(name)
    @name = name
  end
end

test = Test.new("test")

test.say_hello