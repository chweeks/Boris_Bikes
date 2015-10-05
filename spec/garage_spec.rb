require 'Bike'
require 'garage'
require 'bike_container'

describe Garage do

  it { is_expected.to respond_to :bike_rack }

  it { is_expected.to respond_to :fix_bikes }

  it 'Garage workshop is initially empty' do
    expect(subject.bike_rack.empty?).to be true
  end

  describe '#fix_bikes' do
    it 'fixes all bikes in bike_rack' do
      broken_bike = Bike.new
      broken_bike.not_working
      subject.bike_rack << broken_bike
      subject.fix_bikes
      expect(subject.bike_rack.all?{|bike| bike.working?}).to be true
    end
  end

end
