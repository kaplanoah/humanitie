class SessionsController < ApplicationController
  
  def create
    env['ominiauth.auth']
    redirect_to landing_path
  end

end
