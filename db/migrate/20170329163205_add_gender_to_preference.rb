class AddGenderToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :gender, :string
  end
end
