class UserMailerPreview < ActionMailer::Preview
  def booking
    user = Booking.first
    UserMailer.booking(user)
  end
end
