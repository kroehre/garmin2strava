class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :uid
      t.string  :access_token

      t.timestamps
    end
  end
end
