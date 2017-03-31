class MatchesController < ApplicationController
  def create

    @match_one = User.find(current_user.id)
    @possible_matches = User.where('gender=? AND id != ?', @match_one.preference.gender, @match_one.id)

    @possible_matches.each do |m|
      @match_score = 0
      @age = m.find_age
      puts "------Matches' Birthday: #{m.birthday}"
      puts "------Matches' Age: #{@age} ---------------------"
      puts "------User's Preferred Min Age: #{@match_one.preference.min_age} ---------------------"
      puts "------User's Preferred Max Age: #{@match_one.preference.max_age} ---------------------"
      # broken  on the second loop -noidea
      if @age >= @match_one.preference.min_age && @age <= @match_one.preference.max_age
        @match = Match.create(match_one_id: @match_one.id, match_two_id: m.id)
      end
      if @match
        puts "----Matches' Profile: #{m.profile}"
        if @match_one.preference.height_min < m.profile.height && @match_one.preference.height_max > m.profile.height
          @match_score += 8
          puts "Height-------------------------------#{@match_score}"
        end #ends height qualifier
          [:body_type, :status, :has_kids, :wants_kids, :education, :smoking, :drinking, :salary].each do |key|
            if @match_one.preference[key] == m.profile[key]
              @match_score += 8
              puts "OtherPref-----------------------------#{@match_score}"
            end
          end  #end key loop
          @match_one.preference.ethnicities.each do |val|
            m.profile.ethnicities.each do |e|
              if val.name == e.name
                @match_score += 5
                puts "Ethnicity-----------------------------#{@match_score}"
              end
            end
          end #ends ethnicities loop
          @match_one.preference.religions.each do |val|
            m.profile.religions.each do |e|
              if val.name == e.name
                @match_score += 5
                puts "Religion-----------------------------#{@match_score}"
              end
            end
          end #ends religion loop
          @match_one.profile.interests.each do |val|
            m.profile.interests.each do |e|
              if val.name == e.name
                @match_score += 2
                puts "Interests-----------------------------#{@match_score}"
              end
            end
          end #ends interest loop
          puts "FINAL SCORE-----------------------------#{@match_score}"
        if @match_score >= 100
          @match.score = 100
        else
          @match.score = @match_score
        end
        if @match.score >= 70
          @match.is_match = true
        end
        @match.save
      end #ends if @match statement
    end  #end possible match loop
    redirect_to root_path and return
  end

  def show
  end

  def search
    @all_users = User.all
    @time_now = Time.now
    if params[:gender] || params[:min_age] || params[:max_age] || params[:miles] || params[:zip_code]
      @primary_search_results = User.gender(params[:gender]).age_range(params[:min_age], params[:max_age])
      @secondary_search_results = @primary_search_results.within(params[:miles], :origin => params[:zip_code]).all
      if @secondary_search_results.first.nil?

      else
        puts "----#{@secondary_search_results.first.nil?}"
      end
      # redirect_to search_path
    end
  end

  protected
    def find_age(birthday)
      age = Date.today.year - birthday.year
      age -= 1 if Date.today < birthday + age.years
    end

end
