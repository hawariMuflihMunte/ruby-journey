# Ruby .call Method

=begin
a "proc" and a "lambda" can be called directly using
the `.call` method.
=end

proc_test = proc { puts 'I am the proc method! ' }
lambda_test = lambda -> { puts 'I am the lambda method! ' }

proc_test.call # => I am the proc method!
lambda_test.call # => I am the lambda method!

=begin
The following code would result in

"I am the proc method!"

and

"I am the lambda method!"

printed to the console respectively,
once the proc, proc_test, and
the lambda, lambda_test, are called.
=end
