class Preference < ActiveRecord::Base

  belongs_to :user

  has_and_belongs_to_many :ethnicities
  has_and_belongs_to_many :religions
  has_and_belongs_to_many :interests

  validates :min_height, :max_height, :min_age, :max_age, :gender, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary, :ethnicity_ids, :religion_ids, presence: true
  validates :user_id, uniqueness: true
end
