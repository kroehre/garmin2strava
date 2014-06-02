module Strava
  class AuthorizationRequest

    def self.url
      new.url
    end

    def url
      "#{uri}?#{params.to_query}"
    end

    private

    def uri
      Strava.configuration.authorize_uri
    end

    def params
      {
        client_id:        Strava.configuration.client_id,
        redirect_uri:     Strava.configuration.authorize_redirect_uri,
        response_type:    :code,
        scope:            :write,
        approval_prompt:  :auto
      }
    end

  end
end
