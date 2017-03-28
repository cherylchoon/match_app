class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :liker, index: true
      t.references :liked, index: true

      t.timestamps null: false
    end
  end
end
