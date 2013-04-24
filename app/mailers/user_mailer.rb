class UserMailer < ActionMailer::Base
  default :from => "me@nicolasgrenie.com"

  def email_to_mom(email, payment)
    @payment = payment
    begin
      mail(:to => email, :subject => "Pay4Me request") do |format|
        format.text
        format.html
      end
    rescue => e
      logger.info(e)
    end
  end


  #email to the buyer telling him that "mom" will not pay
  def not_paid(email, payment)

  end

  #email to the buyer telling him that "mom" payed!
  def paid(email, payment)

  end

end
