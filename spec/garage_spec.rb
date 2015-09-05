require 'garage'
require 'van'
require 'Bike'
require 'DockingStation'

describe Garage do

  it {expect(subject).to respond_to :workshop}

  it {expect(subject).to respond_to :recieve_broken_bikes}

  it 'Garage workshop is initially empty' do
    expect(subject.workshop.empty?).to be true
  end

  it 'Bikes in workshop are equal to broken bikes from van rack when unloaded' do
    bike1 = Bike.new
    bike2 = Bike.new
    van = Van.new
    station = DockingStation.new
    garage = Garage.new
    bike1.not_working
    bike2.not_working
    station.dock(bike1)
    station.dock(bike2)
    van.collect_broken_bikes(station)
    garage.recieve_broken_bikes(van)
    expect(garage.workshop).to match_array([bike1,bike2])
  end
end
