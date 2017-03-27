class Profile < ActiveRecord::Base
  belongs_to :user

  validates :height_feet, :height_inches, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :religion, :salary, :ethnicity, presence: true
end
