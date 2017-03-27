class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    @images = Picture.all
  end

  def edit
  end

  def image
    newimage = Picture.new(user_id:session[:user_id], image:params[:image])
    if newimage.valid?
      if newimage.image.nil?
        flash[:message] = ["upload value was nil :-("]
      else
      newimage.save
      end
    else
      flash[:message] = ["upload didn't work :-("]
    end
    redirect_to "/users/#{session[:user_id]}"
  end

  protected
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :zip_code, :gender, :birthday)
    end
end
