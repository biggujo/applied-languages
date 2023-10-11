MIN_RAISINS = 2
MAX_RAISINS = 9

# Pretty print
# Pie is an array
def print_pie(pie)
  pie.each_with_index do |row, index|
    puts "~~~" if index > 0
    puts row
  end
end

# Check whether a pie is rectangular
# E.g. 4x3, 8x4
# Pie is an array
def is_pie_rectangular(pie)
  ref_row_length = pie[0].length

  # Check if all rows are equal by length
  (1...pie.length).each do |index|
    if pie[index].length != ref_row_length
      return false
    end
  end

  true
end

# Finds variants to cut a pie with different sizes
def get_dividers(given_number)
  (1..given_number).select do |number|
    given_number % number == 0
  end
end

# Check if some array already exists in other given array
def is_subarray_in_array(array, subarray)
  array.any? { |item| item == subarray }
end

def is_correct_cut(cut)
  cut != nil and cut.count("o") == 1
end

# Cut the pie from [start_row;start_col] to [width - 1; height - 1]
# Mark traversed area with "x"
# Vertical lowering is marked as "\n" to make pretty print easily possible later
def get_pie_cut(pie, start_row, start_col, width, height)
  cut = ""

  (start_row...start_row + height).each do |i|
    (start_col...start_col + width).each do |j|
      if pie[i] == nil
        return nil;
      end

      if pie[i][j] == nil
        return nil;
      end

      if pie[i][j] == "x"
        return nil;
      end

      cut += pie[i][j]
      pie[i][j] = "x"
    end

    cut += "\n"
  end

  [pie, cut]
end

# A backtracking algorithm recursively cuts the pie
def pie_processor(given_pie, res_tmp)
  # If an entire array has been cut (every point is traversed, is equal to "x")
  if given_pie.uniq.size <= 1
    # Return success
    return true
  end

  # Cut with different sizes
  # E.g. 1x8, 2x4, 4x2, 8x1
  (0...$possible_dims.length).each do |dimension_variant|

    # Horizontally first
    cut_width = $possible_dims[-dimension_variant - 1]
    cut_height = $possible_dims[dimension_variant]

    # Vertically first (optional variant)
    # cut_width = possible_dims[dimension_variant]
    # cut_height = possible_dims[-dimension_variant - 1]

    # Save arrays with deep copy
    given_pie_clone = Marshal.load(Marshal.dump(given_pie))
    res_tmp_clone = Marshal.load(Marshal.dump(res_tmp))

    # Traverse each row
    (0...$real_sizes[:height]).each do |cur_row|
      # Traverse row from first free point (not marked as "x") to end of width
      (given_pie_clone[cur_row].count("x")...$real_sizes[:width]).each do |cur_col|
        # Try to cut the pie with cut_width * cut_height dims from [cur_row;cur_col]
        processed_pie, cut = get_pie_cut(given_pie_clone, cur_row, cur_col,
                                         cut_width, cut_height)

        unless is_correct_cut(cut)
          next
        end

        res_tmp_clone << cut

        # Go deeper from the current point
        processor_result = pie_processor(processed_pie, res_tmp_clone)

        # If success and the result is proper and unique
        is_new_answer_correct = (processor_result == true and
          res_tmp_clone.length == $raisins_amount and
          !is_subarray_in_array($all_variants, res_tmp_clone))

        # Save temporary results to final results
        $all_variants << res_tmp_clone if is_new_answer_correct
      end
    end
  end
end

# Variants of pie

# initial_pie = [
#   "........",
#   "..o.....",
#   "...o....",
#   "........",
# ]

# initial_pie = [
#   ".o......",
#   "......o.",
#   "....o...",
#   "..o.....",
# ]

# initial_pie = [
#   ".o.o....",
#   "........",
#   "....o...",
#   "........",
#   ".....o..",
#   "........",
# ]

# initial_pie = [
#   "o....o",
#   "......",
#   "......",
#   "......",
#   "......",
#   "o....o",
# ]

# A "No solutions" variant
# initial_pie = [
#   "......",
#   "..oo..",
#   ".o..o.",
#   ".o..o.",
#   "..oo..",
#   "......",
# ]

# Count raisins
$raisins_amount = initial_pie.join("").count("o").freeze

# Initial checks
unless $raisins_amount >= MIN_RAISINS and $raisins_amount <= MAX_RAISINS
  raise "There must be between #{MIN_RAISINS} and #{MAX_RAISINS} raisins"
end

unless is_pie_rectangular(initial_pie)
  raise "The pie must be rectangular"
end

# A storage for saving all final cut variants
$all_variants = []

# Get initial data
$real_sizes = {
  :width => initial_pie[0].length,
  :height => initial_pie.length,
  :area => initial_pie[0].length * initial_pie.length,
}.freeze

# Compute all possible variants of cuts
# E.g. 1x8, 2x4, 4x2, 8x1
$possible_dims = get_dividers($real_sizes[:area] / $raisins_amount).freeze

if $possible_dims.empty?
  raise "Invalid pie size: no ways to cut the pie"
end

# Do main backtracking
pie_processor(initial_pie, [])

if $all_variants.empty?
  puts "No solutions"
  return
end

# Mark the result with the widest first cut as the preferred one
best_result = $all_variants.max_by { |variant| variant[0] }

puts "Initial pie (#{$real_sizes[:width]} x #{$real_sizes[:height]}):"
print_pie(initial_pie)

puts "Solutions:"
$all_variants.each_with_index do |variant, index|
  puts "Variant #{index + 1}:"
  print_pie variant
end

puts "Best solution (widest first cut):"
print_pie best_result