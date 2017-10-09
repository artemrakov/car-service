class Booking < ApplicationRecord
  after_create :send_booking_email, :send_booking_sms

  validates :first_name, :email, :phone, presence: true

  def send_booking_email
    UserMailer.booking(self.id).deliver_later
  end

  def send_booking_sms
    require 'twilio-ruby'

    account_sid = ENV["TWILLIO_SID"]
    auth_token = ENV["TWILLIO_TOKEN"]

    begin
        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.messages.create(
            body: "Postypilo bronirovanie v AWM. Podrabnaya info otpravlena na po4ty",
            to: "+79103412842",    # Replace with your phone number
            from: "+33644641142")  # Replace with your Twilio number
    rescue Twilio::REST::TwilioError => e
        puts e.message
    end
  end
end
