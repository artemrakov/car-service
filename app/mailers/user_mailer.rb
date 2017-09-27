class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking.subject
  #
  def booking(user_id)
    user = User.find(user_id)
    @user = user
    mail(from: "Команда AWM <amwvrn@google.com>", to: "scoff1k@gmail.com", subject: "Бронь от #{user.first_name}")
  end
end
