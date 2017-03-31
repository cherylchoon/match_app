class ImagesController < ApplicationController
  def index
  end

  def show
    @user = User.find(session[:user_id])
    @person = User.find(params[:id])
    @images = Picture.where(user_id:params[:id])
  end

  def create
    newimage = Picture.new(user_id:session[:user_id], image:params[:image], caption:params[:caption])
    if newimage.valid?
      if newimage.image.nil?
        flash[:notice] = "Image type invalid"
      else
      newimage.save
      redirect_to user_path(current_user.id)
      end
    else
      flash[:notice] = "Upload failed"
    end
    redirect_to :back
  end

  def destroy
    Picture.find(params[:id]).destroy
    redirect_to :back
  end

end
