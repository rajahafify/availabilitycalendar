class BookingsController < ApplicationController
  def create
    @booking_calendars = BookingCalendar.all
    @booking = Booking.new(booking_params)
    @booking_service = BookingService.new(@booking)
    respond_to do |wants|
      if @booking_service.call
        wants.html { redirect_to root_path }
        wants.js
      else
        wants.html do 
          flash.now[:error] = @booking.errors.messages
          render 'booking_calendars/index'
        end
        wants.js
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:email, :contact_no, :start_date, :end_date)
  end
end
