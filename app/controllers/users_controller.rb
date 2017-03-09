class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new_user
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
