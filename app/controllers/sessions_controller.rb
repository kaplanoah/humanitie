class SessionsController < ApplicationController
  
  def create
    auth_hash = env['omniauth.auth']
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to landing_path, notice: "Welcome!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to landing_path, notice: "Signed out"
  end

end