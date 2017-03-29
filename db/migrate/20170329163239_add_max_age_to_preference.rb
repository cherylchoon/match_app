class AddMaxAgeToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :max_age, :integer
  end
end
