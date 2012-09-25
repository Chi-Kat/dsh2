class Classroom < ActiveRecord::Base
  attr_accessible :name, :region_id, :stat, :description, :image, :map

  belongs_to :region
  has_many :attachments
  has_many :facilitators

  mount_uploader :image, ImageUploader
  mount_uploader :map, MapUploader
end
