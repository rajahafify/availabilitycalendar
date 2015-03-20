class ChangeColumnForBookings < ActiveRecord::Migration
  def up
    change_column :bookings, :start_date, :date
    change_column :bookings, :end_date, :date
  end

  def down
    change_column :bookings, :start_date, :datetime
    change_column :bookings, :end_date, :datetime
  end
end
