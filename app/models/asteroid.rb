class Asteroid
  attr_reader :name, :id

  def initialize(data)
    require "pry"; binding.pry
    @name = data[:name]
    @id = data[:id]
  end
end
