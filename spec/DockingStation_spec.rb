require 'DockingStation'
require 'Bike'

describe DockingStation do

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

    describe '#dock(bike)' do
   it 'raises an error when capacity is full' do
        subject.capacity.times {subject.dock Bike.new}
        expect { subject.dock Bike.new}.to raise_error 'Docking Station Full'
      end
    end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:set_capacity).with(1).argument }

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

  it 'Docking Station starts empty' do
    subject.instance_variable_get(:@bikes).length == 0
  end

  it 'adds bike to bikes when docked' do
    bike = Bike.new
    subject.dock(bike)
    subject.instance_variable_get(:@bikes).length > 0
  end

  it 'removes bike from docking station when released' do
    bike = Bike.new
    subject.dock(bike)
    subject.release_bike
    subject.instance_variable_get(:@bikes).length == 0
  end

  it 'changes capcity when request by a user' do
    subject.set_capacity(30)
    expect subject.instance_variable_get(:@capacity) == 30
  end

end
