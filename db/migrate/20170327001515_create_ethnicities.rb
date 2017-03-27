class CreateEthnicities < ActiveRecord::Migration
  def change
    create_table :ethnicities do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
