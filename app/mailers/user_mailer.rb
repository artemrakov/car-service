class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking.subject
  #
  def booking(user)
    @user = user
    email_with_name = %("AWM" <scoff1k@gmail.com>)
    mail(to: email_with_name, subject: "Бронь от #{user.first_name}")
  end
end
