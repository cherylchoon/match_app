class LikesController < ApplicationController


  def add
    like = Like.new(liker_id:session[:user_id], liked_id:params[:id])
    if like.valid?
      like.save
    else
      flash[:error] = like.errors.full_messages
    end
    redirect_to :back
  end

  def remove
    Like.find(params[:id]).destroy
    redirect_to :back
  end


end
