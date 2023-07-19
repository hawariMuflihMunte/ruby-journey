# Conditional Assignment Operator

boyfriend = nil

boyfriend ||= 'Jimmy Jr.'

boyfriend ||= 'Josh'
boyfriend ||= 'Krem'

puts boyfriend

=begin

Since the original value of boyfriend is set to nil
which is nothing, Ruby assigns it a value of 'Jimmy Jr.'
on the following line. Once boyfriend holds this real
value, another reassignment is overlooked by Ruby and
the previous value holds

=end
