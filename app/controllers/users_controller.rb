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
  end

  def edit
    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      flash[:errors] = ["You don't have permission to access this page."]
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy
  end

  def deactivate
    @user = User.find(params[:id])
    if session[:user_id] != @user.id
      redirect_to :back
    else
      @user.update(is_active: false)
      redirect_to login_path
    end
  end

  protected
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :zip_code, :gender, :birthday)
    end
end
