require 'spec_helper'

describe Strava::TokenRequest do

  let(:token_uri)       { Faker::Internet.url }
  let(:client_id)       { Faker::Lorem.characters }
  let(:client_secret)   { Faker::Lorem.characters }
  let(:config) do
    double(token_uri: token_uri,
           client_id: client_id,
           client_secret: client_secret)
  end
  let(:response_body)   { double }
  let(:token_response)  { double }

  before do
    allow(Strava).to receive(:configuration).and_return(config)
    allow(HTTParty).to receive(:post).and_return(double(body: response_body))
    allow(Strava::TokenResponse).to receive(:new).and_return(token_response)
  end

  let(:authorization_code) { Faker::Lorem.characters }

  subject(:token_request) { described_class.new(authorization_code) }

  describe '#response' do
    subject { token_request.response }

    it { should eq token_response }

    it 'should request token from strava' do
      expect(HTTParty).to receive(:post).with(token_uri, query: {
        client_id: client_id,
        client_secret: client_secret,
        code: authorization_code
      })
      subject
    end

    it 'should create a token response' do
      expect(Strava::TokenResponse).to receive(:new).with(response_body)
      subject
    end

  end

end
