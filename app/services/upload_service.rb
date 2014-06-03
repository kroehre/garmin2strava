class UploadService

  attr_reader :access_token, :activity_id

  def initialize(access_token, activity_id)
    @access_token = access_token
    @activity_id  = activity_id
  end

  def upload_activity
    strava_client.upload
  end

  private

  def activity_file
    garmin_client.activity_data
  end

  def garmin_client
    Garmin::ActivityDataClient.new(activity_id)
  end

  def strava_client
    Strava::UploadClient.new(access_token, activity_file, :gpx, external_id: "#{activity_id}.gpx")
  end

end
