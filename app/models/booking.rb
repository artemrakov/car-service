class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms

  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end

  def send_booking_sms

  end
end
