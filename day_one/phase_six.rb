=begin

You're a level six Ruby cleric. I mean what a great
job you've done. Let's review:

# Data

You loaded some data off the internet, traversed a
data structure and selected values.

# Iterating

You iterated all elements of a hash you chainged
some more methods.

# Pretty Printing

And if that wasn't enough, you formatted and
printed some values in a way that is easy to read
for humans. In fact 'you made a real program'.

# IF-ELSIF-ELSE statement

=end

# Class names always begin with a capital letter!

=begin
Equal to

```js
class Blurb {
  constructor() {
    this.content = "";
    this.time = "";
    this.mood = "";
  }
}
```

in JavaScript
=end

# class Blurb
#   attr_accessor :content, :time, :mood
# end


# blurb1 = Blurb.new
# puts blurb1
# blurb1.content = "Today Mount Hood Was Stolen!"
# puts blurb1.content

# # Setting Blurb time and mood
# blurb1.time = Time.now
# blurb1.mood = :sick

# puts blurb1.time
# puts blurb1.mood

=begin
class Blurb {
  constructor(mood, content = "") {
    this.time = new Date();
    this.content = content.slice(0, 40);
    this.mood = mood
  }
}

1. Class definition
  * Ruby: `class Blurb`
  * JS: `class Blurb`
2. Attribute definition
  * Ruby: `attr_accessor :content, :time, :mood`
  * JS: by using `this` keyword
3. Initializer/Constructor
  * Ruby: `def initialize(mood, content = "")`
  * JS: `constructor(mood, content = "")`
=end
class Blurb
  attr_accessor :content, :time, :mood

  def initialize(mood, content = "")
    @time     = Time.now
    @content  = content[0..39]
    @mood     = mood
  end
end

# blurb1 = Blurb.new("happy", "Learning Ruby")
# puts blurb1.time

blurb2 = Blurb.new :confused, "I can not believe Mt. Hood was stolen!"
puts "Time: #{blurb2.time}
Mood: #{blurb2.mood}
Content: #{blurb2.content}"
