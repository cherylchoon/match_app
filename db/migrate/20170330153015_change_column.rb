class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :profiles, :height, :number
    change_column :preferences, :height_max, :number
    change_column :preferences, :height_min, :number
  end
end
