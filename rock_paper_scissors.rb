NEEDED_ARGUMENTS_AMOUNT = 2

VARIANTS = {
  :rock => "rock",
  :paper => "paper",
  :scissors => "scissors",
}

WIN_CONDITIONS = {
  VARIANTS[:rock] => VARIANTS[:scissors],
  VARIANTS[:scissors] => VARIANTS[:paper],
  VARIANTS[:paper] => VARIANTS[:rock],
}

# @param possible_values is a string array
# @return true if every arg in ARGV exists in possible_values
def does_argv_have_needed_values(possible_values)
  ARGV.each do |arg|
    unless possible_values.include?(arg.downcase)
      return false
    end
  end

  true
end

# @return true if length is met
def is_argv_of_needed_length(length)
  ARGV.length == length
end

# An example of the impure function
# @return result of the game as a string
def get_game_results(player_variant, opponent_variant)
  if player_variant == opponent_variant
    return "Draw"
  end

  if WIN_CONDITIONS[player_variant] == opponent_variant
    return "You won"
  end

  if WIN_CONDITIONS[opponent_variant] == player_variant
    return "You lose"
  end

  "Undefined result"
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

unless does_argv_have_needed_values VARIANTS.values
  puts "You must provide two of the following arguments:"
  puts "#{VARIANTS.values.join ", "}"
  return
end

player_variant = ARGV[0]
opponent_variant = ARGV[1]

puts "Yours variant: #{player_variant}"
puts "Opponent variant: #{opponent_variant}"
puts "Result: #{get_game_results player_variant, opponent_variant}"