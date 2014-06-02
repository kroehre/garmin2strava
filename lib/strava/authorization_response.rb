module Strava
  class AuthorizationResponse

    attr_reader :code, :error

    def initialize(params)
      @code   = params[:code]
      @error  = params[:error]
    end

    def authorized?
      code.present?
    end

  end
end
