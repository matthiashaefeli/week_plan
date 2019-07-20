class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :loged_in

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def loged_in
    redirect_to root_path unless current_user
  end
end
