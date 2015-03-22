class BookingCalendarsController < ApplicationController
  def index
    @booking_calendars = BookingCalendar.all.to_a
    @booking = Booking.new
  end
end
