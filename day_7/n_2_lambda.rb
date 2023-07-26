# Ruby lambda

=begin

A "lambda" is an object similar to a proc.
Unlike a "proc", a "lambda" requires a specific
number of arguments passed to it, and it `return`s
to its calling method rather than returning
immediately.

=end

def proc_demo_method
  proc_demo = proc { return 'Only I print!' }
  proc_demo.call
  'But what about me?' # Never reached
end

puts proc_demo_method

# (Notice that the proc break out of the method
# when it return the value)

def lambda_demo_method
  lambda_demo = lambda -> { return 'Will I print?' }
  lambda_demo.call
  "Sorry - it's me that's printed."
end

puts lambda_demo_method

# (Notice that the lambda returns back to the
# method in order to complete it.)
