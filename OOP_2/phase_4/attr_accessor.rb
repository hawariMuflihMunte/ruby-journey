# Ruby attr_accessor Method

# Shortcut to `attr_reader` plus `attr_writer`

class CollegeStudent
  attr_reader :dorm
  attr_accessor :major

  def initialize(dorm, major)
    @dorm = dorm
    @major = major
  end
end
