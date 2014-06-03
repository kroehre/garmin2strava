require 'spec_helper'

describe UploadService do

  let(:access_token)  { Faker::Lorem.characters }
  let(:activity_id)   { Faker::Number.number(6) }
  let(:file)          { StringIO.new(Faker::Lorem.characters) }
  let(:garmin_client) { double(activity_data: file) }
  let(:strava_client) { double(upload: true) }

  before do
    allow(Garmin::ActivityDataClient).to receive(:new).and_return(garmin_client)
    allow(Strava::UploadClient).to receive(:new).and_return(strava_client)
  end

  subject(:service) { described_class.new(access_token, activity_id) }

  describe '#upload_activity' do
    subject { service.upload_activity }

    it 'should get activity file from garmin' do
      expect(Garmin::ActivityDataClient).to receive(:new).with(activity_id)
      subject
    end

    it 'should create strava upload client' do
      expect(Strava::UploadClient).to receive(:new).with(
        access_token, file, :gpx, external_id: "#{activity_id}.gpx")
      subject
    end

    it 'should upload activity to strava' do
      expect(strava_client).to receive(:upload)
      subject
    end

  end
end
