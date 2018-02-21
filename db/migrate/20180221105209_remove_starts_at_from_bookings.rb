class RemoveStartsAtFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :starts_at, :integer
  end
end
