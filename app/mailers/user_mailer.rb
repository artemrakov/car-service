class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.booking.subject
  #
  def booking_awm(booking_id)
    @booking = Booking.find(booking_id)
    mail(to: "scoff1k@gmail.com", subject: "Бронь от #{@booking.first_name}")
  end

  def booking_me(booking_id)
    @booking = Booking.find(booking_id)
    mail(to: "ah16178@qmul.ac.uk", subject: "Бронь от #{@booking.first_name}")
  end
end
