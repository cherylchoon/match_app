class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      if !@user
        flash[:errors] = ["Please enter a valid email address."]
      else
        flash[:errors] = ["Invalid login credentials."]
      end
      redirect_to :back
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
