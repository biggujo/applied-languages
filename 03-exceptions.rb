class MyCustomException < StandardError
  def initialize(msg = "A default message from #{self.class}")
    super(msg)
  end
end

begin
  puts "In begin"
  puts "Work in unsafe section 1"

  # raise MyCustomException.new("My custom message")
  raise MyCustomException # let it be with a default message

  # Is never executed
  puts "Work continues"
  # Handle such error
rescue MyCustomException => e
  puts "In rescue"
  puts e.message

  # Nested raise of an error
  begin
    puts "Work in unsafe section 1.1 (nested section)"

    # Raise an error
    raise MyCustomException
  rescue
    puts "Handle any error"
  end
  # Handles any error but not executed as MyCustomException is handled above
rescue
  puts "Another rescue handles any error"
  # This section runs always
ensure
  puts "In ensure"
  puts "Work ends"
end

begin
  puts "In begin"
  puts "Work in unsafe section 2"

  raise MyCustomException

  # Is never executed too, nothing special
  puts "Work continues"
  # Handles any error
rescue
  puts "In rescue"
  puts "A rescue block catches all errors"
  # Never executes because of error
else
  puts "No error happened during the section 2"
end

begin
  puts "In begin"
  puts "Work in safe section 3"

  # Is executed in the end as no error is raised
  puts "Work ends"
  # Rescue part is never executed
rescue
  puts "In rescue"
  puts "A rescue block catches all errors"
  # Is executed always, as no error is raised
else
  puts "No error happened during the section 3"
end