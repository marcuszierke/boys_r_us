class AddColumnToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :character, :string
  end
end
