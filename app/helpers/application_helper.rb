module ApplicationHelper

	def current_user
    User.find_by_id(session["user_id"])
  end

  def logged_in?
    User.find_by_id(session["user_id"]).present?
  end
  
  def require_login
    if current_user.present?
	     else redirect_to root_url, notice: 'Please login.' 
		end
  end

  def theme_of_the_month
    return Theme.find_by_current_theme(true)
  end

  def array_of_attachments_by_theme_id_and_classroom_id(theme_id,classroom_id)
    attachments_array = []
    attachments = Attachment.scoped
    attachments = attachments.order('created_at').where(:theme_id => theme_id, :classroom_id => classroom_id)
    attachments.each do |attachment|
      attachments_array.push attachment
    end
    return attachments_array
  end


end
