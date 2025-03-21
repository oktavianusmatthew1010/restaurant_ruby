class Order < ApplicationRecord
    belongs_to :user
  
    enum status: { pending: "pending", preparing: "preparing", ready: "ready", delivered: "delivered" }
  
    scope :by_status, ->(status) { where(status: status) if status.present? }
  end
  