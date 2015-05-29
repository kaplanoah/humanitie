class Selfie < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  belongs_to :selfie_pair
end
