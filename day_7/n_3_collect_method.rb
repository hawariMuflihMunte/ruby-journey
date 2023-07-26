# Ruby `.collect` method

=begin
The `.collect` array method takes a block
and applies the expression in the block to
every element of an array.
=end

first_arr = [3, 4, 5]
second_arr = first_arr.collect { |num| num * 5 }

print second_arr
