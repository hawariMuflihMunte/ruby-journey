=begin
The 'loop' construct allows you to create
an infinite loop. It keeps executing a
block of code until explicitly terminated
using a 'break' statement.
=end

counter = 0
loop do
  puts counter
  counter += 1
  break if counter >= 5
end
