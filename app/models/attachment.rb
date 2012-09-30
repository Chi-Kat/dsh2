class Attachment < ActiveRecord::Base
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

  def youtube_thumbnail(link)
      domain = link.split('/')[2]
    
      if domain.include?("youtube")
        query_string = link.split("?").last
        if query_string
          parameters = query_string.split("&")
          if parameters
              id_param = parameters.select { |parameter| parameter[0..1] == "v=" }.first
              if id_param
                id = id_param.split("=").last
              end
          end
        end
        return "http://img.youtube.com/vi/#{id}/1.jpg"
      elsif domain.include?("youtu.be")
          id = link.split('/').last
          return  "http://img.youtube.com/vi/#{id}/1.jpg"
      end

  end

  def thumbnail_url
    if self.image?
      return attachment.image_url(:thumb).to_s
    else
      return youtube_thumbnail(self.youtube_url).to_s
    end
  end

end
