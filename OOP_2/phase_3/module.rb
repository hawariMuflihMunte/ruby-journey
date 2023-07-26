# Ruby Module

=begin
A Ruby module can be created using the module keyword
followed by the module name written in CamelCase
=end

=begin
Contains a set of methods, constants, or classes which
can be accessed with the `.` operator similarly to
classes. Unlike classes, it is impossible to create
instances of a Ruby module
=end

module MyPizza
  FAVE_TOPPING = 'Buffalo Chicken'
end

puts MyPizza::FAVE_TOPPING
