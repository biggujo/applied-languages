# 1. "Abstract" class
class Processor
  def execute
    raise "Can not run a method from an abstract class"
  end
end

# 2. Concrete implementation
class ConcreteProcessor < Processor
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def execute
    @value
  end
end

# 3. Decorator class does nothing as additional work
class Decorator < Processor
  attr_accessor :processor

  def initialize(processor)
    @processor = processor
  end

  def execute
    @processor.execute
    @processor
  end
end

# 4. Decorator classes do some actions
class AppendDecorator < Decorator
  def initialize(decorator, text)
    super(decorator.processor)
    @text = text
  end

  def execute
    @processor.value += @text
    @processor
  end
end

class ReverseDecorator < Decorator
  def initialize(decorator)
    super(decorator.processor)
  end

  def execute
    @processor.value.reverse!
    @processor
  end
end

# Result: someString
processor = Decorator.new(ConcreteProcessor.new("someString"))

# Result: someStringsomeAppendedString
processor = AppendDecorator.new(processor, "someAppendedString")
processor.execute

# Result: gnirtSdedneppAemosgnirtSemos
processor = ReverseDecorator.new(processor)
processor.execute

puts processor.processor.value
