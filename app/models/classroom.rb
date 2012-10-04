class Classroom < ActiveRecord::Base
  attr_accessible :name, :region_id, :stat, :description, :image, :map
  before_save :add_images
  belongs_to :region
  has_many :attachments
  has_many :facilitators

  mount_uploader :image, ImageUploader
  mount_uploader :map, MapUploader

  def add_images
  	if self.image?
  	else self.image = "https://digitalschoolhouse.s3.amazonaws.com/uploads/classroom/image/6/Screen_Shot_2012-10-03_at_4.53.04_PM.png"
  	end
  	if self.map?
  	else self.map = "https://digitalschoolhouse.s3.amazonaws.com/uploads/classroom/image/6/Screen_Shot_2012-10-03_at_4.53.04_PM.png"
  	end
  end
end
