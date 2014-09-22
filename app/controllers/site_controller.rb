class SiteController < ApplicationController

  before_filter :user_signed_in?, only: [:profile, :terms]
  before_filter :accepted_terms?, only: [:profile]

  def user_signed_in?
      redirect_to signin_path unless current_user
  end

  def accepted_terms?
    terms_param = params['terms_of_service']

    if terms_param and terms_param === '1'
      current_user.update_attribute(:accepted_terms, true)
    elsif terms_param
      flash[:error] = 'Please check the box to agree to the terms and conditions'
      redirect_to terms_path
    elsif !current_user.accepted_terms
      redirect_to terms_path
    end
  end

  def landing
  end

  def signin
  end

  def profile
    @selfies = Selfie.all
  end

  def terms
  end

end
