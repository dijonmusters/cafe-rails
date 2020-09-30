class AdminController < ApplicationController
  def home
    @teams = Team.all
    @users = User.all
    @most_recent_successful_matches = Match.most_recent_successful
    @most_recent_unsuccessful_matches = Match.most_recent_unsuccessful
  end
end
