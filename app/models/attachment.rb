class Attachment < ActiveRecord::Base
  attr_accessible :classroom_id, :contributors, :description, :theme_id, :title, :user_id, :youtube_url, :image, :remote_image_url, :region_id

  belongs_to :classroom 
  belongs_to :theme
  belongs_to :user
  belongs_to :region
  before_create :set_region
  mount_uploader :image, ImageUploader
  validates_presence_of :image, :if => :youtube_not_present?, :message => "no go amigo"

  def youtube_not_present?
    domain = youtube_url.split('/')[2]
    if youtube_url == "" || domain == nil
      return true
    elsif domain.include?("youtube") || domain.include?("youtu.be")
      return false
    else return true
    end
  end

 	def set_region
 		self.region_id = Classroom.find(self.classroom_id).region_id
 	end

  def format?
    if self.youtube_url.present?
      link = self.youtube_url
      domain = link.split('/')[2]
      if domain != nil
        if domain.include?("youtube") || domain.include?("youtu.be")
          return "youtube"
        end
      end
    end
    
    if self.image?
      return "image"
    else
      return "unknown"
    end
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
        return "http://img.youtube.com/vi/#{id}/0.jpg"
      elsif domain.include?("youtu.be")
          id = link.split('/').last
          return  "http://img.youtube.com/vi/#{id}/0.jpg"
      end
  end

  def thumbnail_url
    if self.format? == "image"
      return self.image_url(:thumb).to_s
    elsif self.format? == "youtube"
      return youtube_thumbnail(self.youtube_url).to_s
    else        
      return "logo.jpg"
    end
  end

end
