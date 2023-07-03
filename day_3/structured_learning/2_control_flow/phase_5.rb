# `each` method

=begin
To iterate over an array, use the `each` method.
it is preferred over a `for` loop as it is
guaranteed to iterate through each element of
an array.
=end

data = [3, 6, 9, 12]

data.each do |num|
  puts "The number is: #{num}"
end
