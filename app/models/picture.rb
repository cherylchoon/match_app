class Picture < ActiveRecord::Base
  attr_accessor :image
  belongs_to :user
  mount_uploader :image, ImageUploader
end
