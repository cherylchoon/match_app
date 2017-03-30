class ChangeColumnFieldHeightMinToInteger < ActiveRecord::Migration
  def change
    change_column :preferences, :height_min, :number
  end
end
