require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe "#create" do
    it "should create new booking" do
      expect {
        post :create, booking: { email: 'email@example.com', start_date: 1.day.from_now, end_date: 2.days.from_now }
      }.to change(Booking, :count).by 1
    end

    it "should create new booking calendars" do
      expect {
        post :create, booking: { email: 'email@example.com', start_date: 1.day.from_now, end_date: 2.days.from_now }
      }.to change(BookingCalendar, :count).by 2
    end
  end
end
