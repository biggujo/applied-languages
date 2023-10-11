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

