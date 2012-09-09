class User < ActiveRecord::Base
  attr_accessible :email, :name, :image, :password, :password_confirmation

  has_many :assets
  
  has_secure_password

  mount_uploader :image, ImageUploader

  # validates :email, :uniqueness => true

end
