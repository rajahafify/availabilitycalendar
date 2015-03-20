class ChangeColumnForBookingCalendars < ActiveRecord::Migration
  def up
    change_column :booking_calendars, :starts_at, :date
  end

  def down
    change_column :booking_calendars, :starts_at, :datetime
  end
end
