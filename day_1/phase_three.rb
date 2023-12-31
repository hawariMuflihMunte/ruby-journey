books = {
  "Moby Dick" => :splendid,
  "To Kill a Mockingbird" => :timeless
}

# :<value> is a symbol used as the value
# associated with the key (left side value)

books["Gravity Rainbow"] = :splendid
books["The Deep End"] = :abysmal
books["Living Colors"] = :mediocre

#puts books, "\n"
#puts books["Gravity Rainbow"]

# puts books.keys
# puts books.values

# The {0} is a block passed to the `Hash.new`
# It sets the default value for the hash.
ratings = Hash.new {0}

books.values.each { |rate|
  ratings[rate] += 1
}

#puts ratings

#5.times { print "Odelay!\n"}

# The values that are received by the block are placed
# in the variable name at the beginning of the block,
# between two pipe symbol: |

5.times { |time|
  puts time
}
