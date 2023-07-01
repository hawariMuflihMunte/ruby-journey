# Phase 1 Already
#puts 40.to_s.reverse

# to_s converts to strings
# to_i converts to integers
# to_a converts to arrays

fruits = ['Apple', 'Watermelon', 'Salak']

#puts fruits.sort!
#puts "I want to eat an #{fruits[0]}"

# Phase 2 is Upon Us

poem = "My toast has flown from my hand
And my toast has gone to the moon.
But when I saw it on television,
Planting our flag on Halley's comet,
More still did I want to eat it.\n\n"

puts poem

puts poem.gsub("toast", "honeydew")

# gsub is short for global substitute.
# It replaces all occurences of "toast" with "honeydew"

puts poem.reverse
puts poem.lines.reverse
puts poem.lines.reverse.join
