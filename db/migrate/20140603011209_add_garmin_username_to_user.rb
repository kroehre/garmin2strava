class AddGarminUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :garmin_username, :string
  end
end
