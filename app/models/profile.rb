class Profile < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :ethnicities
  has_and_belongs_to_many :religions
  has_and_belongs_to_many :interests

  validates :height, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary, :ethnicity_ids, :religion_ids, :interest_ids, presence: true
  validates :user_id, uniqueness: true

end
