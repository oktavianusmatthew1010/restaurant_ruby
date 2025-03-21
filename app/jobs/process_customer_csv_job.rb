require 'csv'

class ProcessCustomerCsvJob < ApplicationJob
  queue_as :default

  def perform(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      customer = Customer.new(row.to_h)
      unless customer.save
        Rails.logger.error("Failed to import row: #{row.to_h}, Errors: #{customer.errors.full_messages}")
      end
    end
  end
end
