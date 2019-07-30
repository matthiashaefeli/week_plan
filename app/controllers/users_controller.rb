class UsersController < ApplicationController
  def index
    @users = User.all
    @email_array = User.where(info: true).map { |u| u.email }
  end
  
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

  def update
    @user = User.find(params[:id])
    @user.info = params[:info]
    respond_to do |format|
      if @user.save
        format.json { render json: { notice: ['saved.'] } }
      else
        format.json { render json: { notice: @user.errors.full_messages } }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
