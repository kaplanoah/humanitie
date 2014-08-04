class SessionsController < ApplicationController
  
  def create
    auth_hash = env['omniauth.auth']
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to landing_path, notice: "Welcome!"
  end

end