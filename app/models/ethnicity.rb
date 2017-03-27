class Ethnicity < ActiveRecord::Base
  has_and_belongs_to_many :profiles, dependent: :destroy

  validates :ethnicity, presence: true
end
