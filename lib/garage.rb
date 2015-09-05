class Garage

  attr_accessor :workshop

  def initialize
    @workshop = []
  end

  def recieve_broken_bikes(van)
    @workshop = van.unload_broken_bikes
    van.remove_broken_bikes
  end

end
