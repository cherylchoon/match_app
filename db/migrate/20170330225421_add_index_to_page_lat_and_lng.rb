class AddIndexToPageLatAndLng < ActiveRecord::Migration
  def change
    def self.up
      add_index  :users, [:lat, :lng]
    end

    def self.down
      remove_index  :users, [:lat, :lng]
    end
  end
end
