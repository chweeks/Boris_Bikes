require_relative 'bike_container'

class Van

  include BikeContainer

  def collect_working_bikes_from(giver)
    giver.bike_rack.each do |bike|
      bike_rack << bike if bike.working?
    end
    remove_working_bikes(giver)
  end

  def collect_broken_bikes_from(giver)
    giver.bike_rack.each do |bike|
      bike_rack << bike unless bike.working?
    end
    remove_broken_bikes(giver)
  end

  def unload_working_bikes_to(recipient)
    bike_rack.each do |bike|
      recipient.bike_rack << bike if bike.working?
    end
    remove_working_bikes(self)
  end

  def unload_broken_bikes_to(recipient)
    bike_rack.each do |bike|
      recipient.bike_rack << bike unless bike.working?
    end
    remove_broken_bikes(self)
  end

  private

  def remove_broken_bikes(container)
    container.bike_rack.delete_if { |bike| bike.working? == false }
  end

  def remove_working_bikes(container)
    container.bike_rack.delete_if { |bike| bike.working? }
  end

end
