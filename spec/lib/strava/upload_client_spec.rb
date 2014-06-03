require 'spec_helper'

describe Strava::UploadClient do

  let(:access_token) { Faker::Lorem.characters }
  let(:file)         { double }
  let(:data_type)    { Faker::Lorem.word }
  let(:options)      { { foo: 'bar' } }

  subject(:client)  { described_class.new(access_token, file, data_type, options) }

  let(:upload_uri)      { Faker::Internet.url }
  let(:response_hash)   { { status: 'uploading' } }
  let(:upload_response) { double }

  before do
    allow(HTTMultiParty).to receive(:post).and_return(double(body: true))
    allow(JSON).to receive(:parse).and_return(response_hash)
    allow(Strava::UploadResponse).to receive(:new).and_return(upload_response)
    allow(Strava.configuration).to receive(:upload_uri).and_return(upload_uri)
  end

  describe '#upload' do
    subject { client.upload }

    let(:expected_params) do
      { access_token: access_token, file: file, data_type: data_type, foo: 'bar' }
    end

    it 'should upload file to strava' do
      expect(HTTMultiParty).to receive(:post).with(upload_uri, query: expected_params)
      subject
    end

    it 'should create upload response' do
      expect(Strava::UploadResponse).to receive(:new).with(response_hash)
      subject
    end

    it { should eq upload_response }
  end


end
