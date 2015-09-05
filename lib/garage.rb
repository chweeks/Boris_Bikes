class Garage

  attr_accessor :workshop

  def initialize
    @workshop = []
  end

  def recieve_broken_bikes(van)
    @workshop = van.unload_broken_bikes
    van.remove_broken_bikes
  end

  def release_working_bikes(van)
    workshop.select{ |bike| bike.working? == true }
  end

  def remove_working_bikes
    workshop.delete_if{ |bike| bike.working? == true }
  end

  def fix_bikes
    self.workshop.each{ |bike| bike.fix }
  end

end
