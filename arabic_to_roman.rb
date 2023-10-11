roman_values = [
  [1000, "M"],
  [500, "D"],
  [100, "C"],
  [50, "L"],
  [10, "X"],
  [5, "V"],
  [1, "I"],
]

unless ARGV.length == 1
  raise "You need to provide with exactly one argument"
end

# Input
arabic_number = ARGV[0].to_i

unless arabic_number >= 1 and arabic_number < 4000
  raise "The number must be between 1 and 3999"
end

# Output
roman_number = []

# Copy
arabic_number_copy = arabic_number

# Counter
i = 0

# Loop until all digits are processed
until arabic_number_copy == 0
  current_roman_letter = roman_values[i]

  # Check whether the current number meet the requirements:
  # be not greater than the current number
  if current_roman_letter[0] > arabic_number_copy
    # If not, go to next roman symbol
    i += 1
    next
  end

  # Subtract a roman digit value
  arabic_number_copy -= current_roman_letter[0]

  # Save current roman digit
  roman_number << current_roman_letter[1]

  is_more_than_three_sym_repeat = (roman_number.length >= 4 and roman_number.last(4).uniq.size <= 1)

  if is_more_than_three_sym_repeat
    roman_number.pop(3)
    roman_number.push(roman_values[i - 1][1])
  end
end

puts "Input: #{arabic_number}"
puts "Output: #{roman_number.join}"