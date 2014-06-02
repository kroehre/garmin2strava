require 'spec_helper'

describe Garmin::ActivitiesReader do

  let(:json) { '"activityList": [{ "foo": "bar" }]' }

  subject(:reader) { described_class.new(json) }

  let(:activity)      { double }
  let(:activity_hash) { double }
  let(:parsed_json)   { { 'activityList' => [activity_hash] } }

  before do
    allow(JSON).to receive(:parse).and_return(parsed_json)
    allow(Garmin::ActivityMapper).to receive(:map).and_return(activity)
  end

  describe '#read' do
    subject { reader.read }

    it { should eq [activity] }

    it 'should send deserialized activity to activity mapper' do
      expect(Garmin::ActivityMapper).to receive(:map).with(activity_hash)
      subject
    end

  end

end
