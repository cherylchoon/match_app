class RemoveEthnicityFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :ethnicity, :string
  end
end
