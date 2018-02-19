class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :stripper, foreign_key: true
      t.integer :starts_at
      t.integer :ends_at
      t.integer :total_price

      t.timestamps
    end
  end
end
