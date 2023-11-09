# def small_test_lambda
#   lambda = lambda { return }
#   lambda.call
#   puts "After lambda call"
# end
#
# def small_test_proc
#   proc = Proc.new { return }
#   proc.call
#   puts "After lambda call"
# end
#
# small_test_lambda
# small_test_proc

proc = Proc.new { "Proc" }
lambda = -> { "Lambda" }



