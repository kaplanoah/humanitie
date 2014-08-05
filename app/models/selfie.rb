class Selfie < ActiveRecord::Base
  attr_accessible :picture
  mount_uploader :picture, PictureUploader
end
