class Theme < ActiveRecord::Base
  attr_accessible :name, :prompt, :current_theme, default: false

  has_many :attachments

  def current_theme?
  	if self.current_theme == true
  		return true
  	else
  		return false
  	end
  end

  
  
end
