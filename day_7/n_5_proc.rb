# Ruby proc

=begin
A *proc* is an instance of the Proc class
and is similar to a block. As opposed to
a block, a *proc* is a Ruby object which
can be stored in a variable and therefore
reused many times throughout a program.
=end

square = proc { |x| x**2 }
# A proc is defined by calling Proc.new followed by a block.

[2, 4, 6].collect!(&square)
# When passing a proc to a method, an `&` is used to convert the proc into a block.

puts [2, 4, 6].collect!(&square)
