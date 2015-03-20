class BookingCalendarsController < ApplicationController
  def index
    @booking_calendars = BookingCalendar.all.to_a
  end
end
