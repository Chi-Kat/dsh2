class User < ActiveRecord::Base
  attr_accessible :email, :name, :image, :password, :password_confirmation

  has_many :attachments
  
  has_secure_password

  mount_uploader :image, ImageUploader

  # validates :email, :uniqueness => true

	def admin?
    	if self.type == "Admin"
      		true
    	else
      		false
    	end
  	end

  	def teacher?
    	if self.type == "Teacher"
      		true
    	else
      		false
    	end
  	end

end
