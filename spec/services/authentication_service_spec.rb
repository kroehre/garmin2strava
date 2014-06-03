require 'spec_helper'

describe AuthenticationService do

  let(:authorization_code) { Faker::Lorem.characters }
  let(:access_token)       { Faker::Lorem.characters }
  let(:athlete_id)         { Faker::Number.number(2) }
  let(:first_name)         { Faker::Name.first_name }
  let(:last_name)          { Faker::Name.last_name }

  let(:athlete) do
    double(id: athlete_id,
           firstname: first_name,
           lastname: last_name)
  end

  let(:token_response) do
    double(access_token: access_token, athlete: athlete)
  end

  before do
    allow(Strava::TokenRequest).to receive(:new).and_return(
      double(response: token_response))
  end

  subject(:authentication_service) do
    described_class.new(code: authorization_code)
  end

  describe '#authenticate' do
    subject { authentication_service.authenticate }

    it 'should request access token using authorization code' do
      expect(Strava::TokenRequest).to receive(:new).with(authorization_code)
      subject
    end

    its(:first_name)   { should eq first_name }
    its(:last_name)    { should eq last_name }
    its(:uid)          { should eq athlete_id }
    its(:access_token) { should eq access_token }

    context 'for an existing user' do
      let!(:user) do
        create(:user, first_name: first_name,
               last_name: last_name, uid: athlete_id)
      end
      it { should eq user }
    end

    context 'when not authenticated' do
      let(:authorization_code) { nil }
      it { should eq false }
    end

  end

end
