class CreateJoinTableEthnicityPreference < ActiveRecord::Migration
  def change
    create_join_table :ethnicities, :preferences do |t|
      # t.index [:ethnicity_id, :preference_id]
      # t.index [:preference_id, :ethnicity_id]
    end
  end
end
