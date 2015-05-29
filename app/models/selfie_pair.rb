class SelfiePair < ActiveRecord::Base
  belongs_to :user
  has_one :earth_selfie, :class_name => "Selfie"
  has_one :space_selfie, :class_name => "Selfie"
end
