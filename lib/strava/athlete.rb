module Strava

  # id                     | integer         |
  # resource_state         | integer         |
  # firstname              | string          |
  # lastname               | string          |
  # profile_medium         | string          | URL to a 62x62 pixel profile picture
  # profile                | string          | URL to a 124x124 pixel profile picture
  # city                   | string          |
  # state                  | string          |
  # country                | string          |
  # sex                    | string          | ‘M’, ‘F’ or null
  # friend                 | string          | ‘pending’, ‘accepted’, ‘blocked’ or ‘null’; the authenticated athlete’s following status of this athlete
  # follower               | string          | ‘pending’, ‘accepted’, ‘blocked’ or ‘null’; this athlete’s following status of the authenticated athlete
  # premium                | boolean         |
  # created_at             | time string     |
  # updated_at             | time string     |
  # approve_followers      | boolean         | if has enhanced privacy enabled
  # follower_count         | integer         |
  # friend_count           | integer         |
  # mutual_friend_count    | integer         |
  # date_preference        | string          |
  # measurement_preference | string          | ‘feet’ or ‘meters’
  # email                  | string          |
  # ftp                    | integer         |
  # clubs                  | array of object | array of summary representations of the athlete’s clubs
  # bikes                  | array of object | array of summary representations of the athlete’s bikes
  # shoes                  | array of object | array of summary representations of the athlete’s shoes

  class Athlete

    attr_accessor :id, :resource_state, :firstname, :lastname,
      :profile_medium, :profile, :city, :state, :country, :sex,
      :friend, :follower, :premium, :created_at, :updated_at,
      :approve_followers, :follower_count, :friend_count,
      :mutual_friend_count, :date_preference, :measurement_preference,
      :email, :ftp, :clubs, :bikes, :shoes

    def initialize(attributes={})
      attributes.each do |k,v|
        self.send "#{k}=", v
      end
    end

  end
end
