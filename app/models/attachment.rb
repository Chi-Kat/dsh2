class Attachment < ActiveRecord::Base
  attr_accessible :classroom_id, :contributors, :description, :theme_id, :title, :user_id, :youtube_url, :image, :remote_image_url, :region_id

  belongs_to :classroom 
  belongs_to :theme
  belongs_to :user
  belongs_to :region
  before_create :set_region
  before_create :set_format

  mount_uploader :image, ImageUploader

 	def set_region
 		self.region_id = Classroom.find(self.classroom_id).region_id
 	end

 	def set_format
 		if self.image?
 			self.format = "Image"
 		else
 			self.format = "Video"
 		end	
 	end

  	def video?
    	if self.format == "Video"
      		true
    	else
      		false
    	end
  	end

  	def video_tag(link)
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
      		return 	"<iframe width='426.5' 
                      height='252.5' 
                      src='http://www.youtube.com/embed/#{id}' 
                      frameborder='0' 
                      allowfullscreen>
              		</iframe>"
        elsif domain.include?("youtu.be")
      		id = link.split('/').last
      		return 	"<iframe width='426.5' 
                      height='252.5'
                      src='http://www.youtube.com/embed/#{id}' 
                      frameborder='0' 
                      allowfullscreen>
              		</iframe>"
        elsif domain.include?("vimeo")
      		id = link.split('/').last
      		return 	"<iframe src='http://player.vimeo.com/video/#{id}?title=1&amp;byline=0&amp;portrait=0'
                      width='853' 
                      height='505' 
                      frameborder='0' 
                      webkitAllowFullScreen 
                      mozallowfullscreen 
                      allowFullScreen>
              		</iframe>"
    	elsif domain.include?("facebook")
      		id = link.split('=').last
    	return "<object width='853' height='505' >
                	<param name='allowfullscreen' value='true' />
                	<param name='movie' value='http://www.facebook.com/v/#{id}' />
                	<embed src='http://www.facebook.com/v/#{id}' 
                      type='application/x-shockwave-flash' 
                      allowfullscreen='true' 
                      width='853' 
                      height='505'>
                	</embed>
              	</object>"
                  
    	else
      		return "<p>Sorry, we aren't able to embed videos from #{domain} just yet.</p>
              <p><a href='#{link}' target='_blank'>Click here</a> to go directly to the video.</p>"
    	end
  	end

  	# def thumb
  	# 	size = "40x40"
  	# 	if self.image?
  	# 		return image_tag "#{self.image_url(:thumb).to_s}", :size => size
  	# 	elsif self.video? 
  	# 		return "video"
  	# 	end
  	# end
  
	# def thumb
 #  		if self.image?
 #  			return self.image_url(:thumb).to_s
 #  		elsif self.video?
 #  			return "#{video_tag(self.youtube_url)}"
 #  		end
 #  	end



end
