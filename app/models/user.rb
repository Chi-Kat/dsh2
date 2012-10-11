class User < ActiveRecord::Base
  attr_accessible :email, :name, :image, :password, :password_confirmation, :classroom_id

  has_many :attachments
  
  has_secure_password

  mount_uploader :image, ImageUploader

  validates :email, :uniqueness => true

  def admin?
  	self.type == "Admin"
  end

  def facilitator?
    self.type == "Facilitator"
  end

end