class SelfiesController < ApplicationController

  def index
    @selfies = Selfie.all
  end

  def new
    @selfie = Selfie.new
  end

  def create
    parameters = params.require(:selfie).permit(:name, :picture)
    Selfie.create(parameters)
    redirect_to selfies_path
  end

end
