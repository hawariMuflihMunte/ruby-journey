# Combined comparison operator

=begin

Combined comparison operator, `<=>`, also known as the
spaceship operator is used to compare two objects.

If the first operand equals the second,
return 0

If the first is greater than the second,
return 1

If the first is less than the second,
return -1

=end

puts 'Zidan' <=> 'Hawari'

puts 'Hawari' <=> 'Malika'

puts 'Mardin' <=> 'Malika'

# The first letters of each word are
# compared in ASCII order

# Can also be used inside of a block and to sort values in descending order:
my_array = [3, 0, 8, 7, 1, 6, 5, 9, 4]
my_array.sort! { |first_num, second_num| second_num <=> first_num }

print my_array
