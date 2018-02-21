class RemoveEndsAtFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :ends_at, :integer
  end
end
