class Preference < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :ethnicities
  has_and_belongs_to_many :religions
  has_and_belongs_to_many :interests
  
end
