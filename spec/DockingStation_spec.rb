require 'DockingStation'
require 'Bike'

describe DockingStation do

  it "Docking station has a default capacity" do
  expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'changes capacity when requested by a user' do
    subject.capacity = 30
    expect (subject.capacity) == 30
  end

  it 'bikes are initially working' do
    bike = Bike.new
    expect(bike.working?).to be true
  end

  it 'Docking Station initially empty' do
    subject.instance_variable_get(:@bikes).length == 0
  end

  it "releases all the broken bikes to be collected by van" do
    bike1 = double :bike, working?: true, class: Bike
    bike2 = double :bike, working?: false, class: Bike
  	subject.dock bike1
  	subject.dock bike2
  	broken_bikes = subject.release_broken_bikes
  	expect(subject.bikes.select{|bike| bike.working? == false}).to eq broken_bikes
  end

  it { is_expected.to respond_to :release_broken_bikes }

  it { is_expected.to respond_to :remove_broken_bikes }

  describe '#release_bike' do

    it { is_expected.to respond_to :release_bike }

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike(:bike) }.to raise_error 'No bikes available'
    end

    it "raises an error when asked to release broken bike" do
    	bike = double :bike, working?: false, class: Bike
			subject.dock bike
			expect { subject.release_bike bike }.to raise_error "Bike is broken"
    end

    it 'removes bike from docking station when released' do
      bike = double :bike, working?: true, class: Bike
      subject.dock(bike)
      subject.release_bike(bike)
      subject.bikes.length == 0
    end
  end

  describe '#dock(bike)' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'raises an error when capacity is full' do
      bike1 = double :bike, working?: true, class: Bike
      bike2 = double :bike, working?: true, class: Bike
      subject.capacity.times {subject.dock bike1}
      expect { subject.dock bike2 }.to raise_error 'Docking Station Full'
    end

    it "raises an error when not bike" do
      expect { subject.dock(:bike) }.to raise_error "Not a bike"
		end

    it 'adds bike to bikes when docked' do
      bike = double :bike, working?: true, class: Bike
      subject.dock(bike)
      subject.instance_variable_get(:@bikes).length > 0
    end
  end
end
