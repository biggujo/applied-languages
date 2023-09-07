NEEDED_ARGUMENTS_AMOUNT = 2

POSSIBLE_ARGUMENTS = %w[rock paper scissors]

# @param possible_values is a string array
# @return true if every arg in ARGV exists in possible_values
def does_argv_have_needed_values possible_values
  ARGV.each do |arg|
    if !possible_values.include?(arg.downcase)
      return false
    end
  end

  true
end

def is_argv_of_needed_length length
  ARGV.length == length
end

puts ">> Rock Paper Scissors << "

puts

puts "Provided arguments:"
puts "#{ARGV.join ", "} (length: #{ARGV.length})"

puts

unless is_argv_of_needed_length NEEDED_ARGUMENTS_AMOUNT
  puts "You must provide two and only two arguments to proceed."
  return
end

unless does_argv_have_needed_values POSSIBLE_ARGUMENTS
  puts "You must provide two of the following arguments: #{POSSIBLE_ARGUMENTS.join ","}"
end