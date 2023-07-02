=begin
Commonly used to iterate over elements in
a collection, such as an array or a hash.
It applies a block of code to each element.
=end

# Iterating over an array
fruits = ["apple", "banana", "orange"]
fruits.each do |fruit|
  puts fruit
end

# Iterating over a hash
person = { name: 'John', age: 30, city: "New York" }
person.each do |key, value|
  puts "#{key}: #{value}"
end
