require 'spec_helper'

describe Garmin::ActivityDataClient do

  let(:activity_id)   { Faker::Number.number(10) }
  let(:data_type)     { Faker::Lorem.word }
  let(:options)       { { foo: 'bar' } }

  subject(:client)    { described_class.new(activity_id, data_type, options) }

  let(:file)          { StringIO.new(Faker::Lorem.characters) }
  let(:service_uri)   { Faker::Internet.url }

  before do
    allow(client).to receive(:open).and_return(file)
    allow(Garmin.configuration).to receive(:activity_data_uri).and_return(service_uri)
  end

  describe '#activity_data' do
    subject { client.activity_data }

    it { should eq file }

    it 'should request activity data from garmin' do
      expect(client).to receive(:open).with(
        "#{service_uri}/#{data_type}/activity/#{activity_id}?#{options.to_query}")
      subject
    end

  end

end
