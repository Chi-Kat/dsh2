class Classroom < ActiveRecord::Base
  attr_accessible :name, :region_id, :stat, :description

  belongs_to :region
  has_many :assets
  has_many :users
end
