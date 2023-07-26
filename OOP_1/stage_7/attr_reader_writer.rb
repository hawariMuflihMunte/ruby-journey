# Ruby `attr_reader` `attr_writer` methods

class Student
  attr_reader :name
  attr_writer :name

  def initialize(name)
    @name = name
  end
end

# Ruby is able to both read and write the @name instance variable
# since it was passed to attr_reader and attr_writer as a symbol.

top_student = Student.new('Jugo')
puts top_student.name # read
top_student.name = 'Nita' # write
puts top_student.name

