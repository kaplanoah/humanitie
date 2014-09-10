class SelfiesController < ApplicationController

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
      redirect_to signin_path
    end
  end

end
