class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking.subject
  #
  def booking(user)
    @user = user

    mail(to: "scoff1k@gmail.com", subject: "Бронь от #{user.first_name}")
  end
end
