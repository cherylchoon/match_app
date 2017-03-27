class AddProfileIdToEthnicities < ActiveRecord::Migration
  def change
    add_column :ethnicities, :profile_id, :integer
  end
end
