class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms

  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end

  def send_booking_sms
    blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    blowerio['/messages'].post :to => '+79191893713', :message => "Postypilo bronirovanie v AWM. Nomer: #{self.phone}. Podrovnaya info na po4te"
  end
end
