def is_ipv4_valid(ip)
  ip_numbers = ip.split "."

  return false if ip_numbers.length != 4

  ip_numbers.each do |number_str|
    return false unless number_str.to_i.between?(0, 255)
    return false if number_str != number_str.to_i.to_s
  end

  true
end

if ARGV.length != 1
  raise "You need to provide one and only one argument"
end

ip = ARGV[0]

puts "Input: #{ip}"
puts "Is IPv4 valid: #{is_ipv4_valid ip}"
