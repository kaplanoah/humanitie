class SiteController < ApplicationController

  before_filter :user_signed_in?, only: [:profile, :terms]
  before_filter :accepted_terms?, only: [:profile]
  before_filter :have_phone_number?, only: [:profile]

  def user_signed_in?
      redirect_to signin_path unless current_user
  end

  def have_phone_number?
    phone_param = params['phone']

    if phone_param and phone_param.gsub(/\D/, '').length == 10
      current_user.update_attribute(:phone, phone_param)
    elsif phone_param
      flash[:error] = 'Please enter a valid 10 digit phone number'
    end

    unless current_user.phone
      redirect_to phone_path
    end
  end

  def accepted_terms?
    terms_param = params['terms_of_service']

    if terms_param and terms_param === '1'
      current_user.update_attribute(:accepted_terms, true)
    elsif terms_param
      flash[:error] = 'Please check the box to agree to the terms and conditions'
    end

    unless current_user.accepted_terms
      redirect_to terms_path
    end
  end

  def landing
  end

  def signin
  end

  def profile
    @selfies = Selfie.where(:user_id => current_user.id)
  end

  def terms
  end

  def phone
  end

end
