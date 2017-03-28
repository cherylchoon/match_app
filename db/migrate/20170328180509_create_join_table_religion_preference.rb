class CreateJoinTableReligionPreference < ActiveRecord::Migration
  def change
    create_join_table :religions, :preferences do |t|
      # t.index [:religion_id, :preference_id]
      # t.index [:preference_id, :religion_id]
    end
  end
end
