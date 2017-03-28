class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    @personal_message = PersonalMessage.new
      @conversation = Conversation.find(params[:id])
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def check_participating!
      redirect_to conversations_path unless @coversation && @conversation.participates?(current_user)
    end
end
