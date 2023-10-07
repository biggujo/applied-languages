roman_values = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}

unless ARGV.length == 1
  puts "You need to provide with exactly one argument"
end

# Input
roman_number = ARGV[0]

# Previous value to compare values with
previous_digit_value = roman_values["M"]

# Output
arabic_number = 0

# Iterate through each provided digit
roman_number.each_char do |digit|
  unless roman_values.key?(digit)
    puts "Wrong digit: #{digit}"
    return
  end

  if roman_number.scan(digit).length > 3
    puts "The roman digit repeats more than 3 times: #{digit}"
    return
  end

  # Get current value of a digit
  current_digit_value = roman_values[digit]

  # If next value is not bigger than the current one, just add it to result
  # Otherwise, cancel the add of the previous sum and subtract the previous
  # value once more before the add of the next one
  if current_digit_value <= previous_digit_value
    arabic_number += current_digit_value
  else
    arabic_number += current_digit_value - 2 * previous_digit_value
  end

  # Save value
  previous_digit_value = current_digit_value
end

puts "Input: #{roman_number}"
puts "Output: #{arabic_number}"