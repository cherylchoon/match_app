class CreateJoinTableInterestPreference < ActiveRecord::Migration
  def change
    create_join_table :interests, :preferences do |t|
      # t.index [:interest_id, :preference_id]
      # t.index [:preference_id, :interest_id]
    end
  end
end
