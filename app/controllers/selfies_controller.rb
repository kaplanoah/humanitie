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
    space_selfie = Selfie.new(parameters)

    respond_to do |format|
      format.html {
        if not space_selfie.save
          @selfie = space_selfie
          render :new
        elsif current_user
          current_user.selfies.push(space_selfie)
          redirect_to profile_path
        else
          session[:selfie_id] = space_selfie.id
          redirect_to signin_upload_path
        end
      }
      format.json {
        begin
          space_selfie.save

          image_association_ids = params['name'].split('_')
          user_id = image_association_ids[0].to_i
          earth_selfie_id = image_association_ids[1].to_i

          user = User.find(user_id)
          earth_selfie = Selfie.find(earth_selfie_id)

          selfie_pair = SelfiePair.new
          selfie_pair.earth_selfie = earth_selfie
          selfie_pair.space_selfie = space_selfie
          selfie_pair.save

          user.selfies.push(space_selfie)
          user.selfie_pairs.push(selfie_pair)

          recipient_phone = user.phone || ENV['DEFAULT_RECIPIENT_PHONE']
          send_image_text_alert(recipient_phone, space_selfie.picture.feed.url)

          render json: { :status => 200, :message => 'Successfully created selfie from satellite image' }.to_json
        rescue StandardError => e
          e.backtrace.select { |x| x.match(/humanitie/) }.each { |trace| puts trace }
          render json: { :status => 500, :message => e.inspect.gsub(/[#<>]/, '')}.to_json
        end
      }
    end
  end

  def recent
    # selfies taken on earth in the order they were uploaded
    earth_selfies = Selfie.where(:in_space => false).order(created_at: :asc)

    # return first selfie that doesn't have a pair in space
    earth_selfies.each do |earth_selfie|
      if earth_selfie.user and not earth_selfie.selfie_pair
        response = {
          'selfie' => Selfie.where(:in_space => false).last,
          'status' => 200
        }
        render json: response and return
      end
    end

    # no selfie that hasn't been send to space
    response = {
        'selfie' => nil,
        'status' => 204
      }
    render json: response
  end

  protected

  def json_request?
    request.format.json?
  end

end
