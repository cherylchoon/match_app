class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :home_page]
  def home_page
    if current_user
      redirect_to root_path
    end
  end

  def index
    @picture = Picture.find_by(user_id:session[:user_id])
    @users = User.all
    @match = Match.where("match_one_id=? AND is_match=?", session[:user_id], true).order(score: :desc)
    @time_now = Time.now
    # @match = @match.order(score: :desc)
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
      @user.update(loggedin: true)
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
    @user.update(loggedin: false)
    session.delete(:user_id)
    redirect_to login_path
  end

  def createuser
    10.times do
      @first_name = Faker::Name.first_name
      @zip = Faker::Address.zip
      @zip_code = "#{@zip[0]}" + "#{@zip[1]}" + "#{@zip[2]}" + "#{@zip[3]}" + "#{@zip[4]}"
      puts "---Zip Code: #{@zip_code}"
      @lat = @zip_code.to_lat
      @lng = @zip_code.to_lon
      @user = User.create(first_name: @first_name, last_name: Faker::Name.last_name, email: Faker::Internet.free_email("#{@first_name}"), password: "password", zip_code: @zip_code, gender: "Male", lat: @lat, lng: @lng, loggedin: false)
    end
    puts "--------#{Faker::Name.name}"
    redirect_to root_path
  end
end
