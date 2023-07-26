# Ruby yield keyword

=begin
Used to transfer control from a method to a block
and then back to the method once executed.
=end

def yield_test
  puts "I'm inside the method."
  yield
  puts "I'm also inside the method."
end

yield_test { puts ">>> I'm butting into the method!" }
