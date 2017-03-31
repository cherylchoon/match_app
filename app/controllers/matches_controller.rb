class MatchesController < ApplicationController
  def create
    puts
    puts "------------- hit match_controller Create route here -----------------"
    puts
    @match_one = User.find(current_user.id)
    @possible_matches = User.where('gender=? AND id != ?', @match_one.preference.gender, @match_one.id)
    puts
    puts "------------- #{@possible_matches} -----------------"
    puts

    @possible_matches.each do |m|
      @match_score = 0
      @age = find_age(m.birthday)
      puts
      puts "----------------- #{@age} ---------------------"
      puts
      if @age >= @match_one.preference.min_age && @age <= @match_one.preference.max_age
        @match = Match.create(match_one_id: @match_one.id, match_two_id: m.id)
      end
      if @match
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
              end
            end
          end #ends ethnicities loop
          @match_one.preference.religions.each do |val|
            m.profile.religions.each do |e|
              if val.name == e.name
                @match_score += 5
              end
            end
          end #ends religion loop
          @match_one.preference.interests.each do |val|
            m.profile.interests.each do |e|
              if val.name == e.name
                @match_score += 2
              end
            end
          end #ends interest loop
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
    # @users = User.all
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
