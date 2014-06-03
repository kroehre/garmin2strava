class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_login
    unless authenticated?
      redirect_to login_path
    end
  end

  def authenticated?
    current_user.present?
  end

  def current_user
    @current_user ||= user_from_session
  end

  private

  def user_from_session
    User.find(user_id) if user_id.present?
  end

  def user_id
    session[:user_id]
  end

end
