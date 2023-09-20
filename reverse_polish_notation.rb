operator_order = {
  "(" => 0,
  ")" => 0,
  "+" => 1,
  "-" => 1,
  "*" => 2,
  "/" => 2,
}

def operand?(string)
  string.match? /^[0-9.]+$/
end

def operator?(string)
  string.match? /^[+\-*\/]$/
end

if ARGV.length < 1
  puts "You need to separate operators and operands with a space"
  return
end

operators = []
postfix = []

ARGV.each do |entity|
  if operand? entity
    postfix << entity

    next
  end

  if operator? entity
    if operators.length > 1
      until operator_order[operators[-1]] < operator_order[entity] do
        postfix << operators[-1]
        operators.pop
      end
    end

    operators << entity
    next
  end

  if entity == "("
    operators << entity
    next
  end

  if entity == ")"
    until operators[-1] == "(" do
      postfix << operators[-1]
      operators.pop
    end
    next
  end

  puts entity
  puts "The given text is not a valid infix expression"
  return
end

operators.reject! { |operator| operator == "(" }

puts "#{postfix.join " "} #{operators.join " "}"