class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      sessions[:user_id] = user.id
      flassh[:notice] = "Welcome, you've logged in."
      redirect_to root_path

    else
      flash[:error] = 'There is something wrong with your username or password.'
      redirect_to login_path
    end
    # user = User.find_by (username: params[:username])
  end

  def destroy
    sessions[:user_id] = nil
    flash[:notice] = "You've logged out"
    redirect_to root_path
  end

end
