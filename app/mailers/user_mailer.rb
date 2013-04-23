class UserMailer < ActionMailer::Base
  default :from => "me@nicolasgrenie.com"

  def email_to_mom(@user, @orders)
  	begin
  	  mail(:to => @user.email,
         	:subject => "Pay4Me request")
         	 do |format|
      format.text
      format.html
    	end
  	 rescue => e
  	 	logger.info(e)
  	end
  end
end
