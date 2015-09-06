require 'van'
require 'garage'

describe Van do
  it { is_expected.to respond_to :collect_broken_bikes }

  it { is_expected.to respond_to :unload_broken_bikes }

  it { is_expected.to respond_to :remove_broken_bikes }

  it { is_expected.to respond_to :collect_working_bikes }

  it { is_expected.to respond_to :unload_working_bikes }

  it "collects all broken bikes from station" do
    bike1 = double :bike, working?: true, class: Bike
	  bike2 = double :bike, working?: false, class: Bike
    bike3 = double :bike, working?: false, class: Bike
  	station = DockingStation.new
  	station.bikes = [bike1,bike2,bike3]
  	broken_bikes = station.release_broken_bikes
  	subject.collect_broken_bikes(station)
  	expect(subject.rack).to eq broken_bikes
	end

  it "collects all working bikes from garage" do
    bike1 = double :bike, working?: true, class: Bike
	  bike2 = double :bike, working?: true, class: Bike
    bike3 = double :bike, working?: false, class: Bike
    garage = Garage.new
    garage.workshop = [bike1,bike2,bike3]
    working_bikes = garage.release_working_bikes(subject)
    subject.collect_working_bikes(garage)
    expect(subject.rack).to eq working_bikes
  end

  it 'unloads all broken bikes to workshop' do
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

  it "van's rack empties when van unloads broken bikes" do
    garage = Garage.new
    subject.rack << [:bike1, :bike2, :bike3]
    subject.remove_broken_bikes
    expect(subject.rack.empty?).to be true
  end

  it "gives all working bikes to station" do
    bike1 = double :bike, working?: true
	  bike2 = double :bike, working?: true
    bike3 = double :bike, working?: false
    subject.rack << bike1 << bike2 << bike3
    station = DockingStation.new
    subject.unload_working_bikes(station)
    expect(station.bikes).to eql [bike1,bike2]
  end
end
