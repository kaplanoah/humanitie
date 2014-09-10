class SiteController < ApplicationController

  def landing
  end

  def signin
  end

  def profile
    user_id = session[:user_id]
    @user_name = User.find(user_id).name
  end

end
