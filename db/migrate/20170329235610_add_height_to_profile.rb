class AddHeightToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :height, :string
    add_column :preferences, :height_min, :string
    add_column :preferences, :height_max, :string

    remove_column :profiles, :height_feet
    remove_column :profiles, :height_inches
    remove_column :preferences, :max_height_feet
    remove_column :preferences, :max_height_inches
    remove_column :preferences, :min_height_feet
    remove_column :preferences, :min_height_inches
  end
end
