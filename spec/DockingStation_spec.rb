require 'DockingStation'
require 'Bike'

describe DockingStation do

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
  
  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :release_bike }

  it 'Creates bike' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_a Bike
  end

  it 'bike is working' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike.working?).to be true
    end
end
