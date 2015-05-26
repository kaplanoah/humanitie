class SelfiesController < ApplicationController

  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def index
    @selfies = Selfie.all
  end

  def new
    @selfie = Selfie.new
  end

  def create

    # post request from base station
    # http://docs.python-requests.org/en/latest/user/quickstart/#post-a-multipart-encoded-file
    if params['file']
      params['selfie'] = {'picture' => params['file'], 'name' => params['name'], 'in_space' => true}
    end

    parameters = params.require(:selfie).permit(:name, :picture)
    selfie = Selfie.create(parameters)

    respond_to do |format|
      format.html {
        if current_user
          current_user.selfies.push(selfie)
          redirect_to profile_path
        else
          session[:selfie_id] = selfie.id
          redirect_to signin_upload_path
        end
      }
      format.json {
        render json: 'CREATED SELFIE FROM SATELLITE IMAGE!'
      }
    end



  end

  def recent
    binding.pry
    render json: Selfie.last
  end

  protected

  def json_request?
    request.format.json?
  end

end
