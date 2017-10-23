class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms
  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end

  def send_booking_sms
    require 'net/http'
    require 'uri'
    
    url = "https://gate.smsaero.ru/send/?user=#{ENV['SMS_LOGIN']}&password=#{ENV['SMS_PASSWORD']}&to=#{ENV['SMS_NUMBER']}&text=Поступило бронирование в AWM. Имя клиента #{first_name} . Номер #{phone}. Подробная информация отправлена на почту.&from=biznes"
    uri = Addressable::URI.parse(url)
    response = Net::HTTP.get_response(uri)
  end
end
