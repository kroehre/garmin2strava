ActionDispatch::Callbacks.to_prepare do
  Garmin.configure do |config|
    config.activities_uri    = "http://connect.garmin.com/proxy/activitylist-service"
    config.activity_data_uri = "http://connect.garmin.com/proxy/activity-service-1.1"
  end
end
