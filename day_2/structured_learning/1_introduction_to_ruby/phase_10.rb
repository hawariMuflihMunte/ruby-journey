# Get user input in Ruby

=begin
We can get the user's input using `gets.chomp`.
`gets` is the method that is used to retrieve
user input. Ruby automatically adds a new line
after each bit of input, so `chomp` is used
to remove that extra line.
=end

puts "Type your name and press Enter: "
name = gets.chomp

puts "My name is #{name}!"
