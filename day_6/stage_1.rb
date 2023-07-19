# Ruby `.respond_to?`

puts 'A'.respond_to?(:push)

puts 'A'.respond_to?(:next)

=begin

`.respond_to?` takes a symbol representing a method name and
returns `true` if that method can be called on the object and
`false` otherwise.

=end
