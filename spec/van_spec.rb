require 'van'
require 'garage'
require 'bike_container'

describe Van do

    let(:working_bike){double :bike , working?: true}
    let(:broken_bike){double :bike, working?: false}

  context '#collecting' do

    let(:station){double :station, bike_rack: [working_bike, broken_bike]}
    let(:garage){double :garage, bike_rack: [working_bike, broken_bike]}

    it "collects all broken bikes from station" do
      subject.collect_broken_bikes_from(station)
      expect(subject.bike_rack.include?(broken_bike)).to be true
  	end

    it "collects all working bikes from garage" do
      subject.collect_working_bikes_from(garage)
      expect(subject.bike_rack.include?(working_bike)).to be true
    end
  end

  context '#unloading' do

    let(:station){double :station, bike_rack: []}
    let(:garage){double :garage, bike_rack: []}

    it 'unloads all broken bikes to garage' do
      subject.bike_rack << broken_bike
      subject.unload_broken_bikes_to(garage)
      expect(garage.bike_rack.include?(broken_bike)).to be true
    end

    it "van's rack empties of broken bikes when unloaded" do
      subject.bike_rack << broken_bike
      subject.unload_broken_bikes_to(garage)
      expect(subject.bike_rack.include?(broken_bike)).to be false
    end

    it "unloads all working bikes to station" do
      subject.bike_rack << working_bike
      subject.unload_working_bikes_to(station)
      expect(station.bike_rack.include?(working_bike)).to be true
    end

    it "van's rack empties of working bikes when unloaded" do
      subject.bike_rack << working_bike
      subject.unload_working_bikes_to(garage)
      expect(subject.bike_rack.include?(working_bike)).to be false
    end

  end
end
