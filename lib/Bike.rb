class Bike

  attr_accessor :working

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def not_working
    @working = false
  end

  def fix
    @working = true
  end

end
