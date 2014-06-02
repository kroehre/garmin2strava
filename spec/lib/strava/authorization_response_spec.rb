require 'spec_helper'

describe Strava::AuthorizationResponse do

  let(:params) { {} }

  subject { described_class.new(params) }

  context 'when authorization code is returned' do
    let(:params) { { code: Faker::Lorem.characters } }
    it { should be_authorized }
  end

  context 'when authorization code is not returned' do
    let(:params) { { error: 'not authorized' } }
    it { should_not be_authorized }
  end

end
