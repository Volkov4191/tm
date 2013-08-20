class SessionsController < ApplicationController
  skip_before_action :require_login

  def login
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate( params[:password] )
      auth user
      flash[:notice] = "Welcome to Simple Task Manager"
      redirect_to stories_url
    else
      flash[:error]= "Invalid email or password"
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out!"
  end
end
