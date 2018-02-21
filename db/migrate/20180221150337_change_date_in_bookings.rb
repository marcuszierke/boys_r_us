class ChangeDateInBookings < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :date, :string
  end
end
