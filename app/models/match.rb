class Match < ActiveRecord::Base
  after_initialize :set_defaults, unless: :persisted?

  belongs_to :match_one, class_name: 'User', foreign_key: 'match_one_id'
  belongs_to :match_two, class_name: 'User', foreign_key: 'match_two_id'

  validates_uniqueness_of :match_one, :scope => :match_two
  # validates_uniqueness_of :match_two, :scope => :match_one

  protected
    def set_defaults
      self.is_match = false if self.is_match.nil?
    end
end
