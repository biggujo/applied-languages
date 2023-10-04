MIN_RAISINS = 1
MAX_RAISINS = 10

# Check if a pie has a few raisins,
# but not too much and has any at all
def is_right_amount_of_raisins(pie)
  amount = pie.join("").count("o")

  amount >= MIN_RAISINS and amount <= MAX_RAISINS
end

# Check whether a pie has equal rows (columns) or not
def is_pie_a_rectangle(pie)
  overall_pieces_amount = pie.join("").length.to_f
  row_pieces_amount = pie[0].length
  amount_of_rows = pie.length

  overall_pieces_amount / row_pieces_amount == amount_of_rows
end

pie = [
  "...o...",
  "....o..",
  ".o.....",
  "..o....",
]

unless is_right_amount_of_raisins(pie)
  puts "There must be between #{MIN_RAISINS} and #{MAX_RAISINS} raisins"
  exit 1
end

unless is_pie_a_rectangle(pie)
  puts "The pie is not a rectangle"
  exit 1
end

puts "Pie is correct"
