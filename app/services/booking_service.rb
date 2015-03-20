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
      invalidate_column(:start_date) if unavailable_dates.include?(@booking.start_date)
      invalidate_column(:end_date) if unavailable_dates.include?(@booking.end_date)
      return false
    else
      return true
    end
  end

  def invalidate_column column
    @booking.errors.add(column, 'This date is unavailable for booking')
  end
end
