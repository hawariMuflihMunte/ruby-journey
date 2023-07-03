# loop

=begin
A `loop` method can be used to run a block of code repeatedly.
Either use curly braces ({}) or the do/end keyword combination
to wrap the block of code that will be looped.
=end

num_one = 1
loop {
  puts "We are in the loop! ({})"
  num_one += 1
  break if num_one > 3
}
puts "\n"

num_two = 1
loop do
  puts "We are in the loop! (do/end)"
  num_two += 1
  break if num_two > 3
end
puts "\n"

puts "We have exited the loop"
