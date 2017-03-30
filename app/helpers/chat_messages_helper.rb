module ChatMessagesHelper
  def self_or_other(chat_message)
    chat_message.user == current_user ? "self" : "other"
  end

  def chat_message_interlocutor(chat_message)
    chat_message.user == chat_message.conversation.sender ? chat_message.conversation.sender : chat_message.conversation.recipient
  end
end
