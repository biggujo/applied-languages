MIN_RAISINS = 2
MAX_RAISINS = 9

# TODO: Pretty print
# TODO: Code cleanup
# TODO: More testing

# Pretty print
def print_pie(pie, indentation)
  indentation.times { printf " " }
  puts "["

  pie.each do |row|
    (indentation * 2).times { printf " " }
    puts row
  end

  indentation.times { printf " " }
  puts "]"
end

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

def get_pie_cut(pie, start_row, start_col, width, height)
  cut = ""

  (start_row..start_row + height - 1).each do |i|
    (start_col..start_col + width - 1).each do |j|
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

def pie_processor(given_pie, real_sizes, possible_dims, results)
  if possible_dims.length == 0
    return false
  end

  if given_pie.uniq.size <= 1
    return true
  end

  (0..possible_dims.length - 1).each do |dimension_variant|

    # Horizontally first
    cut_width_dim = possible_dims[-dimension_variant - 1]
    cut_height_dim = possible_dims[dimension_variant]

    # Vertically first (optionally)
    # cut_width_dim = possible_dims[dimension_variant]
    # cut_height_dim = possible_dims[-dimension_variant - 1]

    if cut_width_dim > real_sizes[:width] or cut_height_dim > real_sizes[:height]
      next
    end

    # Deep copy
    given_pie_clone = Marshal.load(Marshal.dump(given_pie))
    results_clone = Marshal.load(Marshal.dump(results))

    (0..real_sizes[:height] - 1).each do |cur_row|
      (given_pie_clone[cur_row].count("x")..real_sizes[:width] - 1).each do |cur_col|
        processed_pie, cut = get_pie_cut(given_pie_clone, cur_row, cur_col,
                                         cut_width_dim, cut_height_dim)

        unless cut != nil and cut.count("o") == 1
          next
        end

        results_clone << cut

        # puts cut

        processor_result = pie_processor(processed_pie, real_sizes, possible_dims, results_clone)

        if processor_result == true
          $all_variants << results_clone if results_clone.length == 4
        end
      end
    end
  end
end

# Variants of pie

pie = [
  ".o......",
  "......o.",
  "....o...",
  "..o.....",
]

# pie = [
#   ".o.o....",
#   "........",
#   "....o...",
#   "........",
#   ".....o..",
#   "........",
# ]

# Count raisins
raisins = pie.join("").count("o")

unless raisins >= MIN_RAISINS and raisins <= MAX_RAISINS
  raise "There must be between #{MIN_RAISINS} and #{MAX_RAISINS} raisins"
end

unless is_pie_rectangular(pie)
  raise "The pie must be rectangular"
end

$all_variants = []

# Get initial data
width = pie[0].length
height = pie.length
possible_dimensions = get_dividers(width * height / raisins)

# Do backtracking
pie_processor(pie, {
  :width => width,
  :height => height
}, possible_dimensions, [])

$all_variants.uniq!
best_result = $all_variants.max_by { |variant| variant[0] }

puts "All solutions"
print_pie($all_variants, 2)

puts "Result"
printf "%s", best_result

# puts width
# puts height
# printf "%s", possible_dimensions