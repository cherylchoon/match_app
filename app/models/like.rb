class Like < ActiveRecord::Base
  belongs_to :liker, class_name:'User'
  belongs_to :liked, class_name:'User'
  validates_uniqueness_of :liker_id, :scope => :liked_id #can't like a person more than once

end
