require 'van'

describe Van do
  it { expect(subject).to respond_to :collect_broken_bikes }

  it "van collects all broken bikes from station" do
    bike1 = Bike.new
		bike2 = Bike.new
		bike3 = Bike.new
		station = DockingStation.new
		bike1.not_working
		bike2.not_working
		station.dock bike1
		station.dock bike2
		station.dock bike3
		broken_bikes = station.release_broken_bikes
		subject.collect_broken_bikes(station)
		expect(subject.rack).to eq broken_bikes
	end
end
