class Asset < ActiveRecord::Base
  attr_accessible :classroom_id, :contributors, :description, :theme_id, :title, :user_id, :youtube_url, :image, :remote_image_url

  belongs_to :classroom 
  belongs_to :theme
  belongs_to :user 

  mount_uploader :image, ImageUploader
end