class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def require_login
    redirect_to '/users/signin' unless session[:user_id]
  end
end
