class Child
  @@children = 0

  def initialize(name, birth_year)
    @name = name
    @birth_year = birth_year
    @@children += 1
  end

  def self.children_added
    return @@children
  end
end

naomi = Child.new('Naomi', 2006)
bertha = Child.new('Bertha', 2008)

puts Child.children_added
