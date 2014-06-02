require 'spec_helper'

describe Strava::AuthorizationRequest do

  let(:authorize_uri) { Faker::Internet.url }
  let(:redirect_uri)  { Faker::Internet.url }
  let(:client_id)     { Faker::Lorem.characters }
  let(:config) do
    double(authorize_uri: authorize_uri,
           authorize_redirect_uri: redirect_uri,
           client_id: client_id)
  end

  before do
    allow(Strava).to receive(:configuration).and_return(config)
  end

  subject { described_class.new }

  its(:url) { should start_with "#{authorize_uri}?" }
  its(:url) { should include client_id.to_query("client_id") }
  its(:url) { should include redirect_uri.to_query("redirect_uri") }

end
