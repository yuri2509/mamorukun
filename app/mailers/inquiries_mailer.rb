class InquiriesMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'お問い合わせ')
  end
end
