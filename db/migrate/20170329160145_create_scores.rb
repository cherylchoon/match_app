class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.boolean :height
      t.boolean :body_type
      t.boolean :relationship_status
      t.boolean :has_kids
      t.boolean :wants_kids
      t.boolean :education
      t.boolean :is_smoker
      t.boolean :is_drinker
      t.boolean :salary
      t.boolean :ethnicity
      t.boolean :religion
      t.boolean :interests
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
