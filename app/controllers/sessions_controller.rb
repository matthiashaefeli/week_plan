class SessionsController < ApplicationController
  before_action :loged_in, only: [:destroy]
  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_index_path
    else
      @notice = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: ["Logged out!"]
  end
end
