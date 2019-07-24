class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: ['User was successfully created.'] }
      else
        format.html { redirect_to new_user_path, notice: @user.errors.full_messages }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
