class Asset < ActiveRecord::Base
  attr_accessible :classroom_id, :contributors, :description, :theme_id, :title, :user_id, :youtube_url, :image, :remote_image_url, :region_id

  belongs_to :classroom 
  belongs_to :theme
  belongs_to :user
  belongs_to :region
  before_create :set_region

  mount_uploader :image, ImageUploader

 def set_region
 	self.region_id = Classroom.find(self.classroom_id).region_id
 end

end
