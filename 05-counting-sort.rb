# Test at the end
def non_decreasing_sequence?(array)
  (array.length - 1).times.all? { |item| array[item] <= array[item + 1] }
end

def counting_sort(input_array, max_key)
  # Array of size of all possible keys (inc. zero)
  count_array = Array.new(max_key + 1, 0)

  # Fill the count frequenc array
  input_array.each do |value|
    count_array[value] += 1;
  end

  # Sum all count_array[i] += count_array[i - 1]
  count_array.each_with_index do |value, index|
    if index == 0
      next
    end

    count_array[index] += count_array[index - 1]
  end

  # Create an output array
  output_array = Array.new(input_array.length)

  # Do the following on the each input item:
  # 1. get its value
  # 2. get item in count array by original value index
  # 3. save to output array an input value and decrease the count item by one
  input_array.each do |input_value|
    count_array_cur_index = count_array[input_value]

    count_array[input_value] -= 1

    output_array[count_array_cur_index - 1] = input_value
  end

  output_array
end

if ARGV.length == 0
  puts "Possible argument:"
  puts "\tsize - size of an array to sort (e.g. 5, 10, 100 etc.)"
  return
end

length_of_array = ARGV[0].to_i

array_of_numbers = Array.new(length_of_array) { rand(1..1000) }
max_key = array_of_numbers.max # Is used in count array to store frequencies of all items

puts "Input array:\t #{array_of_numbers.inspect}"

sorted_array = counting_sort(array_of_numbers, max_key)

puts "Sorted array:\t #{sorted_array.inspect}"
puts "Is non-decreasing sequence: #{non_decreasing_sequence? sorted_array}"
