class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user

  include SessionsHelper

  def home
    if logged_in?
      @teams = Team.all
      @team = @teams[rand(0..@teams.count-1)]
      @mutants = Mutant.all
      @mutant = @mutants[rand(0..@mutants.count-1)]
    end
  end

end
