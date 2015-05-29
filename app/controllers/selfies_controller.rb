class SelfiesController < ApplicationController

  include ApplicationHelper

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
      params['selfie'] = {:picture => params['file'], :name => params['name'], :in_space => true}
    end

    parameters = params.require(:selfie).permit(:name, :picture, :in_space)
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
        user_id = params['name'].split('_')[0].to_i
        user    = User.find(user_id)
        user.selfies.push(selfie)
        recipient_phone = user.phone || ENV['DEFAULT_RECIPIENT_PHONE']
        send_image_text_alert(recipient_phone, selfie.picture.feed.url)
        render json: { :status => 200, :message => 'Successfully created selfie from satellite image' }.to_json
      }
    end
  end

  def recent
    render json: Selfie.where(:in_space => false).last
  end

  protected

  def json_request?
    request.format.json?
  end

end
