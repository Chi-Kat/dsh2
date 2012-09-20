class ApplicantMailer < ActionMailer::Base

	default from: "digitalschoolhouse@gmail.com"

 	def application_confirmation(applicant)
    	@applicant = applicant

    	mail to: applicant.email, subject: "Application Received"
  	end

   	def application_notification(applicant)
    	@applicant = applicant
    	@applicants = Applicant.all

    	mail to: "digitalschoolhouse@gmail.com", subject: "New Applicant"
  	end

  	def application_termination(applicant)
    	@applicant = applicant

    	mail to: applicant.email, subject: "Application declined"
  	end

  	def application_acceptance(applicant)
  		@applicant = applicant

    	mail to: applicant.email, subject: "Application accepted"
  	end

end
