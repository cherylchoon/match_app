class EditScoreColumn < ActiveRecord::Migration
  def change
    change_column :scores, :height, :boolean, :default => false
    change_column :scores, :body_type, :boolean, :default => false
    change_column :scores, :relationship_status, :boolean, :default => false
    change_column :scores, :has_kids, :boolean, :default => false
    change_column :scores, :wants_kids, :boolean, :default => false
    change_column :scores, :education, :boolean, :default => false
    change_column :scores, :is_smoker, :boolean, :default => false
    change_column :scores, :is_drinker, :boolean, :default => false
    change_column :scores, :salary, :boolean, :default => false
    change_column :scores, :ethnicity, :boolean, :default => false
    change_column :scores, :religion, :boolean, :default => false
    change_column :scores, :interests, :boolean, :default => false
  end
end
