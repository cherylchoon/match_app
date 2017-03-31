class PersonalMessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation.id) and return if @conversation
    @personal_message = current_user.personal_messages.build
  end

  def create
    puts "-----------#{params[:conversation_id]}"
    if params[:conversation_id]
      @conversation = Conversation.find(params[:conversation_id])
    else
      @conversation = Conversation.create(sender_id: current_user.id, receiver_id: @receiver.id)
    end
    @personal_message = PersonalMessage.new(personal_message_params)
    @personal_message.user_id = current_user.id
    @personal_message.conversation_id = @conversation.id

    if @personal_message.save && @conversation.save
      flash[:notice] = ["Your message has been sent!"]
      redirect_to :back
    else
      flash[:errors] = [@personal_message.errors.full_messages, @conversation.errors.full_messages]
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
        @conversation = Conversation.between(current_user.id, @receiver.id)[0]
        puts "----------#{@conversation.nil?}"
        redirect_to(conversations_path) and return unless @receiver
      else
        @conversation = Conversation.find(params[:conversation_id])
        redirect_to(conversations_path) and return unless @conversation && @conversation.participates?(current_user)
      end
    end
end
