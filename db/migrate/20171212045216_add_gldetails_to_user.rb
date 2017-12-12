class AddGldetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :latitude, :decimal, precision: 9, scale: 6
    add_column :users, :longitude, :decimal, precision: 9, scale: 6
    add_column :users, :glupd_at, :datetime
  end
end
