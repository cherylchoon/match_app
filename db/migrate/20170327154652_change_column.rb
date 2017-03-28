class ChangeColumn < ActiveRecord::Migration
  def self.up
    change_column :profile, :height, :string
    change_column :profile, :salary, :string
  end
  def self.down
    change_column :profile, :height, :integer
    change_column :profile, :salary, :integer
  end
end
