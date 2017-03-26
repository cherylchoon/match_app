class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :location, :zip_code
  end
end
