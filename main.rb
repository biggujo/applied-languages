# 1. "Abstract" class
class Worker
  def execute
    raise "Can not run a method from an abstract class"
  end
end

# 2. Concrete implementation
class ConcreteWorker < Worker
  attr_accessor :string

  def initialize(string)
    @string = string;
  end

  def execute
    @string.upcase!
  end
end

# 3. "Abstract" decorator class
class Decorator < Worker
  attr_accessor :worker

  def initialize(worker)
    @worker = worker
  end

  def execute
    @worker.execute
  end
end

concrete_worker = ConcreteWorker.new("someString")
decorator = Decorator.new(concrete_worker)

puts decorator.execute
