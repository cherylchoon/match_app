class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def new
    if session[:user_id]
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if @user.is_active == false
        @user.update(is_active: true)
        session[:user_id] = @user.id
      end
      session[:user_id] = @user.id
      @user.loggedin = true
      redirect_to root_path
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
    @user = User.find(session[:user_id])
    @user.loggedin = false
    session.clear
    session.delete(:user_id)
    redirect_to login_path
  end
end
