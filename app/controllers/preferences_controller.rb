class PreferencesController < ApplicationController
  def new
    @preferences = Preference.new
  end

  def create
    preference = Preference.new(preference_params)
    preference.user_id = session[:user_id]
    if preference.save
      flash[:notice] = "You have successfully added preferences!"
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = preference.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @preferences = Preference.find_by_user_id(session[:user_id])
  end

  def edit
    @preferences = Preference.find_by_user_id(session[:user_id])
    unless @preferences
      flash[:notice] = "You need to set your preferences first!"
      redirect_to new_preference_path
    end
  end

  def update
    @pref = Preference.find_by_user_id(session[:user_id])
    @pref.update(preference_params)
    if @pref.save
      flash[:notice] = "You have successfully upated your preferences!"
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = @pref.errors.full_messages
      redirect_to :back
    end
  end

  def preference_params
    params.require(:preference).permit(:height_min, :height_max, :min_age, :max_age, :gender, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary, ethnicity_ids:[], religion_ids:[], interest_ids:[])
  end
end
