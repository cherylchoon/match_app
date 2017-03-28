class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :height_feet
      t.integer :height_inches
      t.string :body_type
      t.string :status
      t.string :has_kids
      t.string :wants_kids
      t.string :education
      t.string :smoking
      t.string :drinking
      t.string :ethnicity
      t.string :religion
      t.string :salary
      t.text :interests
      t.text :specifications
      t.text :essay
      t.string :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
