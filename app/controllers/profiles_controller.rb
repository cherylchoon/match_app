class ProfilesController < ApplicationController
  def new
  end

  def create
    profile = Profile.new(profile_params)
    profile.user_id = session[:user_id]
    if profile.save
      flash[:notice] = "You have successfully created a profile!"
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = profile.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(session[:user_id])
    @profile = Profile.find_by_user_id(session[:user_id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      flash[:notice] = "You have successfully upated your profile!"
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = @profile.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @profile = Profile.find_by_user_id(session[:user_id])
  end

  private
  def profile_params
    params.require(:profile).permit(:height_feet, :height_inches, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :religion, :salary, :ethnicity, :interests, :specifications, :essay)
  end
end
