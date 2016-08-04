class UserMailer < ApplicationMailer
  default from: 'accounts@example.com'

  def activation_email(user)
    @user = user
    @url =  activate_users_url + '?activation_token=' + user.activation_token
    mail(to: user.email, subject: 'Welcome to a/A Music App!')
  end
end
