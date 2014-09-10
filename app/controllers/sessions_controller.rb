class SessionsController < ApplicationController
  
  def create
    auth_hash = env['omniauth.auth']
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    if session[:selfie_id]
      selfie = Selfie.find(session[:selfie_id])
      user.selfies.push(selfie)
      session[:selfie_id] = nil
    end
    redirect_to profile_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to landing_path, notice: "Signed out"
  end

end