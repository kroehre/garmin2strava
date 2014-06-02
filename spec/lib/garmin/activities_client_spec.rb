require 'spec_helper'

describe Garmin::ActivitiesClient do

  let(:username)    { Faker::Internet.user_name }
  let(:options)     { { start: 1, limit: 10 } }

  subject(:client)  { described_class.new(username, options) }

  let(:json)        { '{ "foo": "bar" }' }
  let(:service_uri) { Faker::Internet.url }
  let(:activities)  { %w{activity1 activity2} }

  before do
    allow(HTTParty).to receive(:get).and_return(double(body: json))
    allow(Garmin.configuration).to receive(:activities_uri).and_return(service_uri)
    allow(Garmin::ActivitiesReader).to receive(:read).and_return(activities)
  end

  describe '#activities' do
    subject { client.activities }

    it { should eq activities }

    it 'should request activities from web service' do
      expect(HTTParty).to receive(:get).with(
        "#{service_uri}/activities/#{username}", query: options)
      subject
    end

    it 'should pass json to the activities reader' do
      expect(Garmin::ActivitiesReader).to receive(:read).with(json)
      subject
    end
  end

end
