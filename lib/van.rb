class Van

  attr_accessor :rack

  def initialize
    @rack = []
  end

  def collect_broken_bikes(station)
    @rack = station.release_broken_bikes
    station.remove_broken_bikes
  end

  def unload_broken_bikes
    @rack.select{|bike| bike.working? == false}
  end

  def remove_broken_bikes
    @rack.clear
  end

end
