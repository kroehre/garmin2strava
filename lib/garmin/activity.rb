module Garmin
  class Activity

    attr_accessor :id, :type,
      :name, :description,
      :owner_id, :owner_name,
      :calories, :distance,
      :average_speed, :max_speed,
      :average_heart_rate, :max_heart_rate,
      :average_cadence, :max_cadence,
      :elevation_gain, :elevation_loss,
      :start_time, :duration

    def initialize(attributes={})
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end

  end
end
