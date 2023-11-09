thread = Thread.new do
  (1..3).each { |i| puts i }
end

thread.join

thread1 = Thread.new do
  puts "started"
  Thread.stop
  puts "continue"
  sleep 100
  puts "finished"
end

thread1.wakeup