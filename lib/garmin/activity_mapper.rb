module Garmin
  class ActivityMapper

    def self.map(activity_hash)
      new(activity_hash).map
    end

    attr_reader :activity_hash

    def initialize(activity_hash)
      @activity_hash = activity_hash
    end

    def map
      Activity.new(mapped_values)
    end

    private

    def mapped_values
      shallow_values.merge(nested_values)
    end

    SHALLOW_KEYS = {
      id:                 'activityId',
      name:               'activityName',
      average_cadence:    'averageBikingCadenceInRevPerMinute',
      average_heart_rate: 'averageHR',
      average_speed:      'averageSpeed',
      calories:           'calories',
      description:        'description',
      distance:           'distance',
      duration:           'duration',
      elevation_gain:     'elevationGain',
      elevation_loss:     'elevationLoss',
      max_cadence:        'maxBikingCadenceInRevPerMinute',
      max_heart_rate:     'maxHR',
      max_speed:          'maxSpeed',
      owner_name:         'ownerDisplayName',
      owner_id:           'ownerId',
      start_time:         'startTimeGMT'
    }

    def shallow_values
      SHALLOW_KEYS.each_with_object({}) do |(key, hash_key), mapped|
        mapped[key] = activity_hash[hash_key]
      end
    end

    def nested_values
      { type: activity_hash['activityType']['typeKey'] }
    end

  end
end
