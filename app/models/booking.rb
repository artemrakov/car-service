class Booking < ApplicationRecord
  validates :first_name, :email, :phone, presence: true
end
