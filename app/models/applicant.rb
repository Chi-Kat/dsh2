class Applicant < ActiveRecord::Base
  attr_accessible :classroom, :email, :name, :note, :region_id
  belongs_to :region

  
end
