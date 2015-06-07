class Selfie < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  after_initialize :default_name

  def selfie_pair
    id_version = self.in_space ? 'space_selfie_id' : 'earth_selfie_id'
    return SelfiePair.find_by "#{id_version} = ?", self.id
  end

  private

  def default_name
    self.name ||= Time.now.to_i.to_s
  end

end
