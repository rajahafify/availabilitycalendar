require "rails_helper"

describe BookingService do
  let(:booking) { build :booking }

  before do
    @booking_service = BookingService.new booking
  end

  describe "#call" do
    context "valid booking" do

      it "should create booking" do
        expect {
          @booking_service.call
        }.to change(Booking, :count).by 1
      end

      it "should create booking calendar" do
        expect {
          @booking_service.call
        }.to change(BookingCalendar, :count).by 1
      end
    end

    context "invalid booking" do
      before do
        create :booking_calendar, starts_at: 1.day.from_now
      end

      it "shouldn't create booking if there's an existing booking on the same date" do
        booking.start_date = 1.day.from_now
        booking.end_date = 2.day.from_now
        expect {
          @booking_service.call
        }.to change(Booking, :count).by 0
      end
    end
  end 
end
