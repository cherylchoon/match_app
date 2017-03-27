class User < ActiveRecord::Base
  has_secure_password
  has_many :messages

  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :receivers, -> { distinct }, class_name: 'User', through: 'sent_messages'
  has_many :senders, -> { distinct }, class_name: 'User', through: 'received_messages'

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, on: :create
  validates :zip_code, format: { with: /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234" }
  validates_date :birthday, :before => lambda { 18.years.ago }, :before_message => "must be at least 18 years old"

end
