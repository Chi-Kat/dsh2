class Classroom < ActiveRecord::Base
  attr_accessible :name, :region_id, :stat, :description, :image

  belongs_to :region
  has_many :attachments
  has_many :teachers

  mount_uploader :image, ImageUploader
end
