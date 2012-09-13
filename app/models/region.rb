class Region < ActiveRecord::Base
  attr_accessible :name

  has_many :classrooms
  has_many :attachments
  has_many :teachers, :through => :classrooms
  
end
