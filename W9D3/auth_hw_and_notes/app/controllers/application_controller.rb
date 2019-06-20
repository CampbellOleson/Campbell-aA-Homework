class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user # checks if current_user is truthy
  end

  def ensure_user_logged_in
    unless logged_in?
    flash[:error] = "Must log in"
    redirect_to new_session_url #fake
  end

end
