class Booking < ApplicationRecord
  after_create :send_booking_email

  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end
end
