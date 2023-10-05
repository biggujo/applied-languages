require 'csv'

CSV.open("test.csv", "w") do |csv|
  csv << %w[Name Age]
  csv << %w[Ann 12]
  csv << %w[Jack 21]
end

test = CSV.read(File.open("test.csv", headers: true))

puts test