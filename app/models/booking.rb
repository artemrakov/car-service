class Booking < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, :model, presence: true
end
