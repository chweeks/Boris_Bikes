class DockingStation
  def initialize
    @bikes = 0
  end

  def release_bike
      if @bikes < 1
        fail 'No bikes available'
      else
        @bikes -= 1
        Bike.new
      end
  end

  def dock(bike)
    @bikes =+ 1
  end
end
