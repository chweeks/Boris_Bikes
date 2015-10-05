require 'Bike'

describe Bike do

  it 'bikes are initially working' do
    expect(subject.working?).to be true
  end

  context '#not_working' do

    it "sets bike to be not working" do
      subject.not_working
      expect(subject.working?).to be false
    end
  end

  context '#fix' do

    it "sets bike to be working" do
      subject.not_working
      subject.fix
      expect(subject.working?).to be true
    end
  end

end
