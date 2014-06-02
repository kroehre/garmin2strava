require 'spec_helper'

describe Garmin::ActivityMapper do

  let(:id)                 { Faker::Number.number(10) }
  let(:name)               { Faker::Lorem.words }
  let(:average_cadence)    { Faker::Number.number(2) }
  let(:average_heart_rate) { Faker::Number.number(3) }
  let(:average_speed)      { Faker::Number.number(2) }
  let(:calories)           { Faker::Number.number(4) }
  let(:description)        { Faker::Lorem.paragraph }
  let(:distance)           { Faker::Number.number(6) }
  let(:duration)           { Faker::Number.number(4) }
  let(:elevation_gain)     { Faker::Number.number(4) }
  let(:elevation_loss)     { Faker::Number.number(4) }
  let(:max_cadence)        { Faker::Number.number(3) }
  let(:max_heart_rate)     { Faker::Number.number(3) }
  let(:max_speed)          { Faker::Number.number(2) }
  let(:owner_name)         { Faker::Name.name }
  let(:owner_id)           { Faker::Number.number(10) }
  let(:start_time)         { Faker::Number.number(4) }
  let(:type)               { Faker::Lorem.word }

  let(:json_hash) do
    {
      'activityId'                         => id,
      'activityName'                       => name,
      'averageBikingCadenceInRevPerMinute' => average_cadence,
      'averageHR'                          => average_heart_rate,
      'averageSpeed'                       => average_speed,
      'calories'                           => calories,
      'description'                        => description,
      'distance'                           => distance,
      'duration'                           => duration,
      'elevationGain'                      => elevation_gain,
      'elevationLoss'                      => elevation_loss,
      'maxBikingCadenceInRevPerMinute'     => max_cadence,
      'maxHR'                              => max_heart_rate,
      'maxSpeed'                           => max_speed,
      'ownerDisplayName'                   => owner_name,
      'ownerId'                            => owner_id,
      'startTimeGMT'                       => start_time,
      'activityType'                       => { 'typeKey' => type }
    }
  end

  let(:mapped_hash) do
    {
      id:                 id,
      name:               name,
      average_cadence:    average_cadence,
      average_heart_rate: average_heart_rate,
      average_speed:      average_speed,
      calories:           calories,
      description:        description,
      distance:           distance,
      duration:           duration,
      elevation_gain:     elevation_gain,
      elevation_loss:     elevation_loss,
      max_cadence:        max_cadence,
      max_heart_rate:     max_heart_rate,
      max_speed:          max_speed,
      owner_name:         owner_name,
      owner_id:           owner_id,
      start_time:         start_time,
      type:               type
    }
  end

  subject(:mapper) { described_class.new(json_hash) }

  let(:activity) { double }

  before do
    allow(Garmin::Activity).to receive(:new).and_return(activity)
  end

  describe '#map' do
    subject { mapper.map }

    it { should eq activity }

    it 'create a new activity with mapped attributes' do
      expect(Garmin::Activity).to receive(:new).with(mapped_hash)
      subject
    end

  end
end
