class UserMailer < ApplicationMailer
  default from: "support@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Projects!")
  end
end
