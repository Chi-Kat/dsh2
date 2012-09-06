class User < ActiveRecord::Base
  attr_accessible :classroom_id, :email, :name, :role, :image, :password, :password_confirmation

  has_many :assets
  belongs_to :classroom 

  has_secure_password

	mount_uploader :image, ImageUploader

  # validates :email, :uniqueness => true

end
