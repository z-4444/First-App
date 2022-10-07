class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Signed_up.subject
  #
  def signed_up(user)
    @greeting = "Hi"
    @user=user
    mail(
      from: "admin@gmail.com",
      to: @user.email,
      subject: 'New user Signed up'
    )
  end

  def user_activated(user)
    @greeting = "Hi"
    @user=user
    mail(
      from: "admin@gmail.com",
      to: @user.email,
      subject: 'Account Activated'
    )
  end

end
