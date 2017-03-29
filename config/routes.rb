# Rails.application.routes.draw do
#   root "sessions#index"
#
#   get "/login" => "sessions#new"
#   put "/deactivate/:id" => "users#deactivate"
#
#   resources :users, except: [:index]
#   resources :sessions, only: [:create, :destroy]
#
#   resources :images, only: [:show, :create, :destroy]
#   resources :conversations, only: [:index, :show]
#   resources :personal_messages, only: [:new, :create]
#
#   get "images/destroy/:id" => "images#destroy"
#
#   resources :profiles
#   resources :preferences

# end

class MatchesController < ApplicationController
  def create
    @match_one = User.find(current_user.id)
    @possible_matches = User.where('gender=? AND id != ?', @match_one.preference.gender, @match_one.id)
    @possible_matches.where('age>=? AND age<=?', @match_one.preference.min_age, @match_one.preference.max_age)

    @possible_matches.each do |match| unless @match.exist?
      @match = Match.new(match_one: @match_one, match_two: match)
      Score.new(match: @match)
    end
    
  end

   def show
   end
 end
