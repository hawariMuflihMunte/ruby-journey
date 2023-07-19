# `if` statement short expression

num = 6

if num % 2 == 0
  puts 'This number is even!'
end

# Refactored
puts 'This number is even (refactored version)!' if num % 2 == 0
