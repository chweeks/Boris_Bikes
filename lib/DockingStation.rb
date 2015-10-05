require_relative 'bike_container'

class DockingStation

  include BikeContainer

  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize
    super
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike(bike)
    fail 'No bikes available' if bike_rack.empty?
    fail "Bike is broken" if bike.working? == false
    bike_rack.delete bike
  end

  def dock(bike)
    fail "Docking Station Full" if full?
    fail "Not a bike" if bike.class != Bike
    bike_rack << bike
  end

  private

  def full?
    bike_rack.count >= capacity
  end

  def empty?
    bike_rack.empty?
  end

end
