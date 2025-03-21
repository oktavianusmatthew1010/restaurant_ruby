class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :table_number, null: false
      t.datetime :reserved_at, null: false
      t.string :status, default: "pending", null: false

      t.timestamps
    end

    add_index :reservations, [:table_number, :reserved_at], unique: true
  end
end
