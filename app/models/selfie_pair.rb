class SelfiePair < ActiveRecord::Base
  belongs_to :user
  belongs_to :earth_selfie, :class_name => "Selfie"
  belongs_to :space_selfie, :class_name => "Selfie"
end
