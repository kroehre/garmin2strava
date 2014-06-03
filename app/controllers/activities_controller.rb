class ActivitiesController < ApplicationController

  before_action :require_login, :require_setup
  skip_before_action :require_setup, only: [:setup, :update]

  def index
    @activities = client.activities
  end

  def setup
    if request.put?
      current_user.update_attributes(setup_params)
      redirect_to action: :index
    end
  end

  def upload
    upload_response = UploadService.new(current_user.access_token, params[:activity_id]).upload_activity
    if upload_response.error?
      redirect_to activities_path, alert: upload_response.status
    else
      redirect_to activities_path, notice: upload_response.status
    end
  end

  private

  def require_setup
    if current_user.garmin_username.blank?
      redirect_to action: :setup
    end
  end

  def client
    @client ||= Garmin::ActivitiesClient.new(current_user.garmin_username)
  end

  def setup_params
    params.require(:user).permit(:garmin_username)
  end
end
