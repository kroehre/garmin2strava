module Strava
  class UploadClient

    attr_reader :access_token, :file, :data_type, :options

    def initialize(access_token, file, data_type, options={})
      @access_token  = access_token
      @file          = file
      @data_type     = data_type
      @options       = options
    end

    def upload
      UploadResponse.new JSON.parse(upload_response)
    end

    private

    def upload_response
      HTTMultiParty.post(uri, params).body
    end

    def uri
      Strava.configuration.upload_uri
    end

    def params
      { query: { access_token: access_token, file: file, data_type: data_type }.merge(options) }
    end

  end
end
