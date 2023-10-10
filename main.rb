MIN_RAISINS = 2
MAX_RAISINS = 9

# Check whether a pie has equal rows (columns) or not
def is_pie_rectangular(pie)
  ref_row_length = pie[0].length

  (1..pie.length - 1).each do |index|
    if pie[index].length != ref_row_length
      return false
    end
  end

  true
end

def get_dividers(given_number)
  (1..given_number).select do |number|
    given_number % number == 0
  end
end

def cut_the_pie(given_pie, real_sizes, possible_dimensions, result)
  (0..possible_dimensions.length - 1).each do |dimension_variant|
    cut_width_dimension = possible_dimensions[dimension_variant]
    cut_height_dimension = possible_dimensions[-dimension_variant - 1]

  end
end

def change_array(array)
  array.delete(0)
end

pie = [
  "...o....",
  "....o...",
  ".o......",
  "..o.....",
]

raisins = pie.join("").count("o")

unless raisins >= MIN_RAISINS and raisins <= MAX_RAISINS
  raise "There must be between #{MIN_RAISINS} and #{MAX_RAISINS} raisins"
end

unless is_pie_rectangular(pie)
  raise "The pie must be rectangular"
end

puts "Initial pie is correct"

# Get initial data
width = pie[0].length
height = pie.length
possible_dimensions = get_dividers(width * height / raisins)
possible_result = []

cut_the_pie(pie, {
  :width => width,
  :height => height
}, possible_dimensions, possible_result)

# puts width
# puts height
# printf "%s", possible_dimensions