# count = 0
# threads = []
# 10.times do |i|
#   threads[i] = Thread.new do
#     sleep(rand(0.1))
#     Thread.current["mycount"] = count
#     count += 1
#   end
# end
# threads.each { |t| t.join; print t["mycount"], ", " }
# puts "count = #{count}"

Thread.report_on_exception = false

threads = []
4.times do |number|
  threads << Thread.new(number) do |i|
    raise "Boom!" if i == 2
    print "#{i}\n"
  end
end
threads.each { |t| t.join }
