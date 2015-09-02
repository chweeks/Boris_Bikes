class DockingStation
  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Docking Station Full" if @bikes.length == @capacity
    @bikes << bike
  end

  def capacity
    @capacity
  end

  def set_capacity(new_capacity)
    new_capacity = @capacity
  end
  
end
