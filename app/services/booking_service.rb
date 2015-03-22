class BookingService
  attr_accessor :booking

  def initialize booking
    @booking = booking
  end

  def call
    ActiveRecord::Base.transaction do
      if validate_availability
        @booking.save!
        book_dates
      else
        return false
      end
    end
    true    
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def book_dates
    @booking.dates.each do |date|
      @booking.booking_calendars.create(starts_at: date)
    end
  end

  def validate_availability 
    unavailable_dates = BookingCalendar.unavailable_dates(@booking.dates)
    if unavailable_dates.present?
      @booking.errors.add(:start_date, "This dates is not available for bookings: #{unavailable_dates}")
      @booking.errors.add(:end_date, "This dates is not available for bookings: #{unavailable_dates}")  
      return false
    else
      return true
    end
  end
end
