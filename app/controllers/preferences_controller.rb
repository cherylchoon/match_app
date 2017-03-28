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

  def preference_params
    params.require(:preference).permit(:min_height_feet, :min_height_inches, :max_height_feet, :max_height_inches, :body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary, ethnicity_ids:[], religion_ids:[], interest_ids:[])
  end
end
