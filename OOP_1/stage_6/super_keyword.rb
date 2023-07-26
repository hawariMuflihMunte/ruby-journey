# Ruby super keyword

=begin
used to directly access the attributes or methods of a superclass.
This means a class with `super` will inherit the attributes or
methods of a superclass
=end

class Trip
  def initialize(duration, price)
    @duration = duration
    @price = price
  end
end

class Cruise < Trip
  def initialize(duration, price)
    super
  end
end

spain_backpacking = Trip.new(14, 800.00)
carnival = Cruise.new(7, 2400.00)

# The `Cruise` class inherits from the `Trip` and all of its attributes,
# including duration and price, are carried over with the super keyword.
