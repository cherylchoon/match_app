class AddMinAgeToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :min_age, :integer
  end
end
