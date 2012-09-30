class Theme < ActiveRecord::Base
  attr_accessible :name, :prompt, :current_theme, default: false

  has_many :attachments

  
  
end
