class SiteController < ApplicationController

  def landing
  end

  def signin
  end

  def profile
    redirect_to signin_path unless current_user
    redirect_to terms_path  unless current_user.accepted_terms
    @selfies = Selfie.all
  end

  def terms
  end

end
