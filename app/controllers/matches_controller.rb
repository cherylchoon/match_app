class MatchesController < ApplicationController
  def create
    @match_one = User.find(current_user.id)
    @possible_matches = User.where('gender=? AND id != ?', @match_one.preference.gender, @match_one.id)

    @possible_matches.each do |match|
      @age = find_age(match.birthday)
      if @age >= @match_one.preference.min_age && @age <= @match_one.preference.max_age
        @match = Match.create(match_one_id: @match_one.id, match_two_id: match.id)
      end
      if @match
        @match_score = 0
        [:body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary].each do |key|
          if @match_one.preference[key] == match.profile[key]
            @match_score += 8
          end
          @match.score = @match_score
          @match.save
        end
      end
    end
    redirect_to root_path and return
  end

  def show
  end

  protected
    def find_age(birthday)
      age = Date.today.year - birthday.year
      age -= 1 if Date.today < birthday + age.years
    end

end
