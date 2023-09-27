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
    @processor
  end
end

# 4. Decorator classes do some actions
class AppendDecorator < Decorator
  def initialize(decorator, text)
    super(decorator)
    @text = text
  end

  def execute
    executed_processor = @processor.execute
    executed_processor.value += @text
    executed_processor
  end
end

# class ReverseDecorator < Decorator
#   def initialize(processor)
#     super(processor)
#   end
#
#   def execute
#     @processor.execute
#     self
#   end
# end

processor_original = ConcreteProcessor.new("someString")
processor = AppendDecorator.new(processor_original, "12")
processor = AppendDecorator.new(processor, "34")
# processor = ReverseDecorator.new(processor)

processor.execute

puts processor_original.value
# puts processor.processor.processor.processor.value
