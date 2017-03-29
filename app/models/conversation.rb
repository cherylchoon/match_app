class Conversation < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :sender, uniqueness: {scope: :receiver}
  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

  scope :participating, -> (user) do
    where("conversations.sender_id = ? OR conversations.receiver_id = ?", user.id, user.id)
  end

  scope :between, -> (sender_id, receiver_id) do
    where(sender_id: sender_id, receiver_id: receiver_id) + where(sender_id: receiver_id, receiver_id: sender_id)
  end

  def with(current_user)
    sender == current_user ? receiver : sender
  end

  def participates?(user)
    sender == user || receiver == user
  end
end
