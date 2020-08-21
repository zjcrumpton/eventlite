class UserController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
    render "users/show.html.erb"
  end
end
