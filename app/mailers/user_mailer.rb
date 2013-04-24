class UserMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default :from => "me@nicolasgrenie.com"

  def email_to_mom(email, payment)
    @payment = payment
    @order = payment.order.to_struct
    @payer = payment.payers_name
    @buyer = payment.buyers_name
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
  def not_paid(email, name)
    @name = name
  	begin
      mail(:to => email, :subject => "Pay4Me request rejected") do |format|
        format.text
        format.html
      end
    rescue => e
      logger.info(e)
    end

  end

  #email to the buyer telling him that "mom" payed!
  def paid(email, name)
    @name = name
  	begin
      mail(:to => email, :subject => "Pay4Me request approved") do |format|
        format.text
        format.html
      end
    rescue => e
      logger.info(e)
    end

  end

end
