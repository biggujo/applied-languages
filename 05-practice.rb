begin
  2 / 1
rescue ZeroDivisionError => error
  puts error.message # divided by 0
ensure
  puts "Finally code"
end

# def divide(x, y)
#   raise ArgumentError, "Second argument in zero" if y == 0
#   x / y
# end
#
# divide(2, 3)
# divide(4, 1)
# divide(2, 0)