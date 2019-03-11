class Booking < ApplicationRecord
  require 'net/http'
  require 'uri'

  after_create :send_booking_sms
  validates :phone, presence: true

  def send_booking_email
    UserMailer.booking(id).deliver_now
  end

  def send_booking_sms
    url_1 = "https://gate.smsaero.ru/send/?user=#{ENV['SMS_LOGIN']}&password=#{ENV['SMS_PASSWORD']}&to=#{ENV['SMS_NUMBER_1']}&text=Поступило бронирование в AWM. Номер #{phone}.&from=biznes"
    url_2 = "https://gate.smsaero.ru/send/?user=#{ENV['SMS_LOGIN']}&password=#{ENV['SMS_PASSWORD']}&to=#{ENV['SMS_NUMBER_2']}&text=Поступило бронирование в AWM. Номер #{phone}.&from=biznes"
    send_sms(url_1)
    send_sms(url_2)
  end

  def send_sms(url)
    uri = Addressable::URI.parse(url)
    Net::HTTP.get_response(uri)
  end
end
