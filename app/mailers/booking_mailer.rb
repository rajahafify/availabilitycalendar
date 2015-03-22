class BookingMailer < ApplicationMailer
  default from: 'no-reply@availability-calendar.com'
  def booking_confirmation booking
    @booking = booking
    mail to: @booking.email
  end
end
