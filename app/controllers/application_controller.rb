class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, :logged_on_user

  def logged_on_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to login_path unless session[:user_id]
  end

  def find_age
    age = Date.today.year - self.birthday.year
    age -= 1 if Date.today < self.birthday + age.years
    return age
  end


    def height_to_string(height)
      strheight = height.to_s
      temp = ""
      temp << strheight[0]
      temp << "\'"
      temp << strheight[2]
      if strheight[3] == 0 || strheight[3].nil?
        temp << "0"
      else
        temp << strheight[3]
      end
      temp << "\""
      return temp
    end

  helper_method :current_user, :height_to_string
end
