require 'spec_helper'

describe Strava::TokenResponse do

  let(:json) { double }
  let(:access_token) { Faker::Lorem.characters }
  let(:athlete_hash) { { 'foo' => 'bar' } }
  let(:athlete)      { double }

  before do
    allow(JSON).to receive(:parse).and_return(
      { access_token: access_token, athlete: athlete_hash })
    allow(Strava::Athlete).to receive(:new).and_return(athlete)
  end

  shared_examples "deserialized json" do
    it 'deserializes response json' do
      expect(JSON).to receive(:parse).with(json)
      subject
    end
  end

  subject(:token_response) { described_class.new(json) }

  describe '#access_token' do
    subject { token_response.access_token }

    it_should_behave_like 'deserialized json'

    it { should eq access_token }
  end

  describe '#athlete' do
    subject { token_response.athlete }

    it 'should create an athlete' do
      expect(Strava::Athlete).to receive(:new).with(athlete_hash)
      subject
    end

    it_should_behave_like 'deserialized json'

    it { should eq athlete }
  end

end
