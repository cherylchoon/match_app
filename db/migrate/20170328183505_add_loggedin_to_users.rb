class AddLoggedinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :loggedin, :boolean
  end
end
