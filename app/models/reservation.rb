class Reservation < ApplicationRecord
    belongs_to :customer
  
    validates :table_number, presence: true
    validates :reserved_at, presence: true, uniqueness: { scope: :table_number, message: "Table is already booked at this time" }
    validate :reservation_in_future
  
    enum status: { pending: "pending", confirmed: "confirmed", cancelled: "cancelled" }
  
    def reservation_in_future
      errors.add(:reserved_at, "must be at least 1 hour in the future") if reserved_at < 1.hour.from_now
    end
  end
  