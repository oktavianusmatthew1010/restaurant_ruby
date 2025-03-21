class Reservation < ApplicationRecord
    belongs_to :customer
  
    enum status: { pending: "pending", confirmed: "confirmed", cancelled: "cancelled" }
  
    validates :table_number, presence: true
    validates :reserved_at, presence: true
    validates :reserved_at, uniqueness: { scope: :table_number, message: "This table is already reserved at this time." }
    validate :reservation_at_least_an_hour_in_future
  
    scope :confirmed_today, -> {
      where(status: "confirmed", reserved_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(:reserved_at)
    }
  
    private
  
    def reservation_at_least_an_hour_in_future
      return unless reserved_at.present? && reserved_at < 1.hour.from_now
  
      errors.add(:reserved_at, "must be at least 1 hour in the future.")
    end
  end
  