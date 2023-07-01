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
puts books.values
