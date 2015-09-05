require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :not_working }

  it { is_expected.to respond_to :fix }

  it "sets bike to be not working" do
    subject.not_working
    expect(subject.working?).to be false
  end
end
