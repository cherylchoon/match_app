class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :receiver, index: true, foreign_key: true
      t.references :sender, index: true, foreign_key: true
      t.text :content
      t.string :title

      t.timestamps null: false
    end
  end
end
