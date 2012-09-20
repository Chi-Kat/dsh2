class Region < ActiveRecord::Base
  attr_accessible :name, :image, :description

  has_many :classrooms
  has_many :attachments
  has_many :facilitators, :through => :classrooms

  mount_uploader :image, ImageUploader
  
end
