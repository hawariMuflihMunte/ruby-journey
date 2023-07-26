# Ruby `.new` method

class Fighter
  def initialize(name, style, division, age)
    @name = name
    @style = style
    @division = division
    @age = age
  end
end

conor = Fighter.new('Conor', 'mixed martial arts', 'Welterweight', 31)
