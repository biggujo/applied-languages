require 'ipaddr'

def is_ipv4_valid(ip)
  begin
    return IPAddr.new(ip).ipv4?
  rescue
    return false
  end
end

if ARGV.length != 1
  raise "You need to provide one and only one argument"
end

ip = ARGV[0]

puts "Input: #{ip}"
puts "Is IPv4 valid: #{is_ipv4_valid ip}"