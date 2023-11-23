def word_count(text)
  filtered_text = text.gsub(/[^a-zA-Z0-9 ]/, " ")

  counter = {}

  filtered_text.split(" ").each do |word|
    # puts word
    if counter[word] == nil
      counter[word] = 1
    else
      counter[word] += 1
    end
  end

  counter
end

def print_results(results)
  results.each do |word, count|
    puts "#{word}: #{count}"
  end
end

text = File.read "text.txt"

results = word_count text

results = results.sort_by { |word, count| count }
results.reverse!

print_results results