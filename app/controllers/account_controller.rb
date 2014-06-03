class AccountController < ApplicationController

  def login
    redirect_to Strava::AuthorizationRequest.url
  end

  def authorize
    user = AuthenticationService.new(params).authenticate
    if user.present?
      session[:user_id] = user.id
      render text: "Welcome #{user.first_name} #{user.last_name}"
    else
      render text: "unauthorized!"
    end
  end

end
