class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms

  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end

  def send_booking_sms
    blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
    blowerio['/messages'].post :to => '+44 7478 244248', :message => "Поступило бронирование \n Бронь от #{self.first_name} #{self.last_name} \n Номер: #{self.phone} \n Подробная информация поступила вам на почту"
  end
end
