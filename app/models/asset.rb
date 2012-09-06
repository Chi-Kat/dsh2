class Asset < ActiveRecord::Base
  attr_accessible :classroom_id, :contributors, :description, :theme_id, :title, :user_id, :youtube_url, :image, :remote_image_url

  belongs_to :classroom 
  belongs_to :theme
  belongs_to :user
 
  

  mount_uploader :image, ImageUploader

  # functions as 'belongs_to :region, :through => :classroom'
  def region
  	classroom.region
  end

  # def asset_filter
  # 	self.where(:theme_id)

  # 	Self.where(:theme_id => position,
  #                :classroom_id => min_hourly)
  # end

end
