class UsersController < ApplicationController

  # GET /users/1
  # GET /users/1.json
  def show
    @profile = User.find(1).as_profile #Only Professor X can use the app
    @tag_colors = ['default', 'primary', 'success', 'warning', 'danger', 'info']
    render 'shared/profile'
  end

end
