require 'DockingStation'
require 'Bike'

describe DockingStation do
    dock = DockingStation.new
    bike = dock.release_bike
    it { is_expected.to respond_to :release_bike }
    it { expect(bike).to be_a Bike }
    it 'bike is working' do
      expect(bike.working?).to be true
    end
end
