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

def pie_processor(given_pie, real_sizes, possible_dims, result)
  (0..possible_dims.length - 1).each do |dimension_variant|
    if given_pie.uniq.size <= 1
      return false
    end

    cut_width_dim = possible_dims[-dimension_variant - 1]
    cut_height_dim = possible_dims[dimension_variant]

    if cut_width_dim > real_sizes[:width] or cut_height_dim > real_sizes[:height]
      next
    end

    (0..real_sizes[:height] - 1).each do |cur_row|
      (given_pie[cur_row].count("x")..real_sizes[:width] - 1).each do |cur_col|
        pie, cut = get_pie_cut(given_pie, cur_row, cur_col, cut_width_dim, cut_height_dim)

        unless cut != nil and cut.length > 0
          next
        end

        result << cut

        puts cut

        if pie_processor(pie, real_sizes, possible_dims, result) == false
          break
        end
      end
    end
  end
end

def get_pie_cut(pie, start_row, start_col, width, height)
  cut = ""

  (start_row..start_row + height - 1).each do |i|
    (start_col..start_col + width - 1).each do |j|
      if pie[i][j] == nil
        return nil;
      end

      cut += pie[i][j]
      pie[i][j] = "x"
    end
  end

  [pie, cut]
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

pie_processor(pie, {
  :width => width,
  :height => height
}, possible_dimensions, possible_result)

puts "Result"
printf "%s", possible_result

# puts width
# puts height
# printf "%s", possible_dimensions