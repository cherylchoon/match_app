class CreateJoinTableProfileEthnicity < ActiveRecord::Migration
  def change
    create_join_table :ethnicities, :profiles do |t|
      # t.index [:ethnicity_id, :profile_id]
      # t.index [:profile_id, :ethnicity_id]
    end
  end
end
