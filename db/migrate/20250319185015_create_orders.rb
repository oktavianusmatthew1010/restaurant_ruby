class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: "pending", null: false
      t.decimal :total, precision: 10, scale: 2, null: false, default: 0.0

      t.timestamps
    end
  end
end
