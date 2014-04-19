class Poi < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  acts_as_votable
  has_many :comments
  has_many :pictures

  accepts_nested_attributes_for :pictures

end
