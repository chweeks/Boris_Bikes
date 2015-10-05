require_relative 'bike_container'

class Garage

  include BikeContainer

  def fix_bikes
    bike_rack.each do |bike|
      bike.fix
    end
  end

end
