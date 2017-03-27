class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :height
      t.string :body_type
      t.string :status
      t.string :has_kids
      t.string :wants_kids
      t.string :education
      t.string :smoking
      t.string :drinking
      t.string :religion
      t.integer :salary
      t.text :interests
      t.text :specifications
      t.text :essay

      t.timestamps null: false
    end
  end
end
