# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/new_user_waiting
  def new_user_waiting
    AdminMailer.new_user_waiting
  end

end
