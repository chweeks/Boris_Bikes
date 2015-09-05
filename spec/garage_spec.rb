require 'garage'
require 'van'
require 'Bike'
require 'DockingStation'

describe Garage do

  it { is_expected.to respond_to :workshop }

  it { is_expected.to respond_to :recieve_broken_bikes }

  it { is_expected.to respond_to :fix_bikes }

  it { is_expected.to respond_to :release_working_bikes }

  it { is_expected.to respond_to :remove_working_bikes }

  it 'Garage workshop is initially empty' do
    expect(subject.workshop.empty?).to be true
  end

  describe '#fix_bikes' do
    it 'fixes all bikes in workshop' do
      bike1 = Bike.new
      bike1.not_working
      subject.workshop = [bike1]
      subject.fix_bikes
      expect(subject.workshop.all?{|bike| bike.working? == true}).to equal true
    end
  end

  describe '#release_working_bikes' do
    it 'releases all working bikes' do
      bike1 = double :bike1, working?: true
      bike2 = double :bike2, working?: true
      bike3 = double :bike3, working?: false
      van = double :van, rack: []
      subject.workshop = [bike1,bike2,bike3]
      expect(subject.release_working_bikes(van)).to eql [bike1,bike2]
    end
  end

  describe '#remove_working_bikes' do
    it 'removes all working bikes' do
    bike1 = double :bike1, working?: true
    bike2 = double :bike2, working?: true
    bike3 = double :bike3, working?: false
    subject.workshop = [bike1,bike2,bike3]
    subject.remove_working_bikes
    expect(subject.workshop).to eql [bike3]
    end
  end
end
