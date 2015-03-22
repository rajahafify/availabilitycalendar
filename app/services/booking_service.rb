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
        send_confirmation_email
      else
        return false
      end
    end
    true    
  rescue ActiveRecord::RecordInvalid
    false
  end

  private
  def validate_availability 
    unavailable_dates = BookingCalendar.unavailable_dates(@booking.dates)
    if unavailable_dates.present?
      @booking.errors.add(:dates, unavailable_dates: unavailable_dates.map{ |date| date.strftime('%d/%m/%Y')})
      return false
    else
      return true
    end
  end

  def book_dates
    @booking.dates.each do |date|
      @booking.booking_calendars.create(starts_at: date)
    end
  end

  def send_confirmation_email
    BookingMailer.booking_confirmation(@booking).deliver_now
  end
end
