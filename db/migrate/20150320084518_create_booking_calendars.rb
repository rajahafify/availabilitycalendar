class CreateBookingCalendars < ActiveRecord::Migration
  def change
    create_table :booking_calendars do |t|
      t.datetime :starts_at
      t.belongs_to :booking, null:false, index: true

      t.timestamps null: false
    end
    add_index :booking_calendars, :starts_at, unique: true
    add_foreign_key :booking_calendars, :bookings
  end
end
