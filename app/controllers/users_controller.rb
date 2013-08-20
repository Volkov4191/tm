class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new( new_params )

    if @user.save
      flash[:notice] = "Welcome to Simple Task Manager"
      redirect_to stories_url
    else
      render 'new'
    end
  end

  private
    def new_params
      params.require(:user).permit( :email, :password, :password_confirmation )
  end
end
