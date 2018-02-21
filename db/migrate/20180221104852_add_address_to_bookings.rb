class AddAddressToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :address, :string
  end
end
