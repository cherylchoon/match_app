class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ethnicities

  validates :height, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :religion, :salary, presence: true

end
