class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms
  validates :phone, presence: true

  def send_booking_email
    UserMailer.booking(id).deliver_now
  end

  def send_booking_sms
    require 'net/http'
    require 'uri'

    url = "https://gate.smsaero.ru/send/?user=#{ENV['SMS_LOGIN']}&password=#{ENV['SMS_PASSWORD']}&to=#{ENV['SMS_NUMBER_1']}&text=Поступило бронирование в AWM. Номер #{phone}.&from=biznes"
    url = "https://gate.smsaero.ru/send/?user=#{ENV['SMS_LOGIN']}&password=#{ENV['SMS_PASSWORD']}&to=#{ENV['SMS_NUMBER_2']}&text=Поступило бронирование в AWM. Номер #{phone}.&from=biznes"
    uri = Addressable::URI.parse(url)
    response = Net::HTTP.get_response(uri)
  end
end
