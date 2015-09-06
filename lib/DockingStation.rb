class DockingStation

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  attr_accessor :bikes

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike(bike)
    fail 'No bikes available' if @bikes.empty?
    fail "Bike is broken" if bike.working? == false
    @bikes.delete bike
  end

  def dock(bike)
    fail "Docking Station Full" if full?
    fail "Not a bike" if bike.class != Bike
    @bikes << bike
  end

  def release_broken_bikes
		@bikes.select{ |bike| bike.working? == false }
	end

	def remove_broken_bikes
		bikes.delete_if{ |bike| bike.working? == false }
	end

  def recieve_working_bikes(van)
    van.rack.each{ |bike| bikes << bike if bike.working? == true }
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
