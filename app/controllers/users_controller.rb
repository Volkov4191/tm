class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new( new_params )

    if @user.save
      redirect_to root, :notice => 'Signed up'
    else
      render 'new'
    end
  end

  private
    def new_params
      params.require(:user).permit( :email, :password, :password_confirmation )
  end
end
