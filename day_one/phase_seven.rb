=begin
# Classes

Everything in Ruby is some kind of object.
Classes explain objects, how a certain object works.

For example:
You made a few Blurb objects and these objects are
explained in the Blurb class.

# Accessors

Accessors are variables attached to an object which
can be used 'outside' to the object.
(blurb2.time = Time.now)

# Object Variables

Object variables are the same variables you're
using for accessors, but 'inside' the object.
(@time = Time.now)
=end
class Blurb
  attr_accessor :content, :time, :mood

  def initialize(mood, content = "")
    @time     = Time.now
    @content  = content[0..39]
    @mood     = mood
  end

  def moodify
    if @mood == :sad
      return ":-("
    elsif @mood == :happy
      return ":-)"
    end

    # The default mood
    ":-|"
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = []
    # A fresh clean array
    # for sorting Blurbs
  end

  def add_a_blurb(mood, content)
    # The << means add to the end of the array
    @blurbs << Blurb.new(mood, content)
  end

  def show_timeline
    puts "Blurbify: #{@title} has #{@blurbs.count} Blurbs"

    @blurbs.sort_by { |t|
      t.time
    }.reverse.each { |t|
      puts "#{t.content.ljust(40)} #{t.time}"
    }
  end
end

myapp = Blurbalizer.new("The Big Blurb")
puts myapp.show_timeline
myapp.add_a_blurb(:sick, "Hello from JavaScript")
myapp.add_a_blurb(:very_happy, "Hello from Java")
myapp.add_a_blurb(:anxious, "Hello from Python")
myapp.add_a_blurb(:rad, "Hello from COBOL")
puts myapp.show_timeline
