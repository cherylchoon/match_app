class MatchesController < ApplicationController
  def create
    @match_one = User.find(current_user.id)
    @possible_matches = User.where('gender=? AND id != ?', @match_one.preference.gender, @match_one.id)
    @possible_matches.where('age>=? AND age<=?', @match_one.preference.min_age, @match_one.preference.max_age)
  
    @possible_matches.each do |match|
      @match = Match.create(match_one_id: @match_one.id, match_two_id: match.id)
      @score = Score.create(match: @match)
      if @match.save && @score.save
        redirect_to :back
      else
        flash[:errors] = [@match.errors.full_messages, @score.errors.full_messages]
        redirect_to :back
      end
    end
  end

  def show
  end

end
