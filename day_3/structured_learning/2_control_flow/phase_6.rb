# `next` keyword

=begin
`next` keyword is used within a loop to pass over
certain elements and skip to the following iteration.
It is useful for omitting elements that you do not
wish to have iterated. `next` is followed by an `if`
statement which defines which elements are to be
skipped.
=end

for i in 1..10
  next if i % 2 == 0
  puts i
end
