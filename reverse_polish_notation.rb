OPERATORS = {
  :left_parenthesis => "(",
  :right_parenthesis => ")",
  :plus_sign => "+",
  :minus_sign => "-",
  :multiply_sign => "*",
  :divide_sign => "/",
}

operator_order = {
  OPERATORS[:left_parenthesis] => 0,
  OPERATORS[:right_parenthesis] => 0,
  OPERATORS[:plus_sign] => 1,
  OPERATORS[:minus_sign] => 1,
  OPERATORS[:multiply_sign] => 2,
  OPERATORS[:divide_sign] => 2,
}

def operand?(string)
  # True if a string has digits and a dot
  string.match? /^[0-9.]+$/
end

def operator?(string)
  # True if +, -, * or /
  string.match? /^[+\-*\/]$/
end

if ARGV.length < 1
  puts "You need to separate operators and operands with a space"
  return
end

# Temp stack for operators
operators = []

# Resulting postfix notation
postfix = []

# Represent each argument as an entity to analyze
ARGV.each do |entity|
  if operand? entity
    # Save every operand
    postfix << entity

    next
  end

  if operator? entity
    # Print higher or same order operators
    # and remove them from the temp array
    if operators.length > 1
      until operator_order[operators[-1]] < operator_order[entity] do
        postfix << operators[-1]
        operators.pop
      end
    end

    # Save current operator
    operators << entity
    next
  end

  if entity == OPERATORS[:left_parenthesis]
    # Save every left parenthesis
    operators << entity
    next
  end

  if entity == OPERATORS[:right_parenthesis]
    # Print all operators that were added to temp array
    # since left parenthesis, remove them from temp array
    until operators[-1] == OPERATORS[:left_parenthesis] do
      postfix << operators[-1]
      operators.pop
    end

    # Remove the left parenthesis itself
    operators.pop
    next
  end

  # If non-correct entity did occur, stop with an error
  puts "The given text is not a valid infix expression"
  puts "Reason: #{entity}"
  return
end

puts "#{postfix.join " "} #{operators.join " "}"