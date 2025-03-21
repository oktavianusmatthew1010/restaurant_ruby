class Customer < ApplicationRecord
    has_many :orders
  
    scope :frequent_customers, lambda {
      joins(:orders)
        .where('orders.created_at >= ?', 30.days.ago)
        .group('customers.id')
        .having('COUNT(orders.id) >= 5')
    }
  end
  