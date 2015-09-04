class Van

  attr_accessor :rack

  def initialize
    @rack = []
  end

  def collect_broken_bikes(station)
    @rack = station.release_broken_bikes
    station.remove_broken_bikes
  end

  def unload_broken_bikes(garage)
    garage.workshop = @rack
    @rack.clear
  end

  def collect_working_bikes

  end

end
