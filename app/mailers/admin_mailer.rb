class AdminMailer < ApplicationMailer
  default from: 'support@example.com'
  layout 'mailer'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_user_waiting.subject
  #
  def new_user_waiting(email)
    # @greeting = "Hi"
    @user=email
    mail(from:@user.email,to: 'admin@gmail.com', subject: 'New User Awaiting for Approval')
  end
end
