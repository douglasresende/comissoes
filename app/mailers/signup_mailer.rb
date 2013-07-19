class SignupMailer < ActionMailer::Base
  default :from => 'no-reply@maxstudio.com.br'

  def confirm_email(user)
    @user = user
    @confirmation_link = confirmation_url({
      :token => @user.confirmation_token
    })
    
    mail({
      :to => user.email,
      :bcc => ['sign ups <douglas@maxstudio.com.br>'],
      :subject => I18n.t('signup_mailer.confirm_email.subject')
  })
  end
end