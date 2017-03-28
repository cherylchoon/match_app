class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :min_height_feet
      t.integer :min_height_inches
      t.integer :max_height_feet
      t.integer :max_height_inches
      t.string :body_type
      t.string :status
      t.string :has_kids
      t.string :wants_kids
      t.string :education
      t.string :smoking
      t.string :drinking
      t.string :salary
      t.text :specifications
      t.text :essay
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
