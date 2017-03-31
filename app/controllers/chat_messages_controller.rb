class Chat_messagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @chat_message = @chat.chat_messages.build(chat_message_params)
    @chat_message.user_id = current_user.id
    @chat_message.save!

    @path = chat_path(@chat)
  end


  private

  def chat_message_params
    params.require(:chat_message).permit(:body)
  end
end
