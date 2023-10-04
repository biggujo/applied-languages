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
    # Some possible processing by default
    @value = @value.split("").join(" ")
    self
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
  end
end

# 4. Decorator classes do some actions
class AppendDecorator < Decorator
  def initialize(processor, text)
    super(processor)
    @text = text
  end

  def execute
    executed_processor = @processor.execute
    executed_processor.class.new(executed_processor.value + @text)
  end
end

class ReverseDecorator < Decorator
  def initialize(processor)
    super(processor)
  end

  def execute
    executed_processor = @processor.execute
    executed_processor.class.new(executed_processor.value.reverse)
  end
end

processor_original = ConcreteProcessor.new("someString")
processor = AppendDecorator.new(processor_original, "12") # someString12
processor = ReverseDecorator.new(processor) # 21gnirtSemos
processor = AppendDecorator.new(processor, "34") # 21gnirtSemos34

puts processor.execute.value
puts processor_original.value
