class ChatsController < ApplicationController

  layout false

  def create
    if Chat.between(params[:sender_id],params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id],params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end

    render json: { chat_id: @chat.id }
  end

  def show
    @chat = Chat.find(params[:id])
    @reciever = interlocutor(@chat)
    @chat_messages = @chat.chat_messages
    @chat_message = ChatMessage.new
  end

  private
  def chat_params
    params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(chat)
    current_user == chat.recipient ? chat.sender : chat.recipient
  end

end
