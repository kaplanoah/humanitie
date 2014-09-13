class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    session[:user_id] = nil if ( session[:user_id] && !User.find(session[:user_id]) )
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def user_accepted_terms
    # update current user
  end

end
