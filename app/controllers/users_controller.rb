class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    lat = params[:user][:zip_code].to_s.to_lat
    @user.lat = lat
    lng =  params[:user][:zip_code].to_s.to_lon
    @user.lng = lng
    if @user.save
      flash[:notice] = "You have registered successfully, please fill in the questionaire."
      session[:user_id] = @user.id
      redirect_to new_profile_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @image = Profile.find_by(user_id: params[:id]).image
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
    @images = Picture.all
    @profileimg = Picture.find_by(user_id:params[:id])
    @likeyet = Like.where(liker_id:session[:user_id], liked_id:params[:id])


    @user_location = [@user.lat,@user.lng]
    puts "----User Location: #{@user_location}"
    @nearby_users = User.within(50, :origin => @user_location).all
    puts "----Nearby Users: #{@nearby_users.first.first_name} #{@nearby_users.second.first_name}"
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
