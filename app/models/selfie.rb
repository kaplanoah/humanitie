class Selfie < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user

  def selfie_pair
    id_version = self.in_space ? 'space_selfie_id' : 'earth_selfie_id'
    return SelfiePair.find_by "#{id_version} = ?", self.id
  end

end
