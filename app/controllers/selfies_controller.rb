class SelfiesController < ApplicationController

  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def index
    @selfies = Selfie.all
  end

  def new
    @selfie = Selfie.new
  end

  def create
    parameters = params.require(:selfie).permit(:name, :picture)
    selfie = Selfie.create(parameters)
    if current_user
      current_user.selfies.push(selfie)
      redirect_to profile_path
    else
      session[:selfie_id] = selfie.id
      redirect_to signin_upload_path
    end
  end

  def recent
    render json: Selfie.last
  end

end
