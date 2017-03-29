class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.boolean :is_match, :default => false
      t.references :match_one, index: true
      t.references :match_two, index: true

      t.timestamps null: false
    end
  end
end
