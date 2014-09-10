class SiteController < ApplicationController

  def landing
  end

  def signin
  end

  def profile
    redirect_to signin_path unless current_user
    @selfies = Selfie.all
  end

end
