# To(be) or not to(be)

# Actually, you can omit parentheses when
# calling a function/method. Ruby doesn't mind it though.

# For example:
# puts "Hello"
# puts("Hello")
# These examples both are fine and works.

def tame(number_of_shrews)
  number_of_shrews.times {
    puts "Tamed a shrew"
  }
  return number_of_shrews
end

#tame(2)
#tame 2
puts tame(2)
