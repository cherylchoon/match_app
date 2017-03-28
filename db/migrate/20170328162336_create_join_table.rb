class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :religions, :profiles do |t|
      # t.index [:religion_id, :profile_id]
      # t.index [:profile_id, :religion_id]
    end
  end
end
