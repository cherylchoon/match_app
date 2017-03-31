class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    profile.user_id = session[:user_id]
    if profile.save
      flash[:notice] = "You have successfully created a profile! Please fill out your preferences."
      newimage = Picture.new(user_id:session[:user_id], image:params[:image], caption:params[:caption])
      if newimage.valid?
        newimage.save
      end
      redirect_to "/preferences/new"
    else
      flash[:errors] = profile.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(session[:user_id])
    @profile = Profile.find_by_user_id(params[:id])
    @likeyet = Like.where(liker_id:session[:user_id], liked_id:params[:id])
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
    if @profile
      @user = User.find(session[:user_id])
      @profile = Profile.find_by_user_id(session[:user_id])
    else
      flash[:notice] = "Please create a profile."
      redirect_to new_profile_path
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:height, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary, :specifications, :essay, :image, ethnicity_ids:[], religion_ids:[], interest_ids:[])
  end
end
