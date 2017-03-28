class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  def create
    @conversation ||= Conversation.new(sender_id: current_user.id, receiver_id: @receiver.id)
    @personal_message = current_user.personal_messages.build(personal_message_params)
    @personal_message.conversation_id = @conversation.id

    if @personal_message.save
      flash[:notice] = ["Your message has been sent!"]
      redirect_to :back
    else
      flash[:errors] = @personal_message.errors.full_messages
      redirect_to :back
    end
  end

  private
    def personal_message_params
      params.require(:personal_message).permit(:content)
    end

    def find_conversation!
      if params[:receiver_id]
        @receiver = User.find(params[:receiver_id])
        redirect_to(conversations_path) and return unless @receiver
        @conversation = Conversation.between(current_user.id, @receiver.id)[0]
      else
        @conversation = Conversation.find(params[:conversation_id])
        redirect_to(conversations_path) and return unless @conversation && @conversation.participates?(current_user)
      end
    end
end
