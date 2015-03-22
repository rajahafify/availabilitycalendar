require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  describe "#booking_confirmation" do
    it "send booking confirmation" do
      booking = create :booking
      BookingMailer.booking_confirmation(booking).deliver_now
      expect(ActionMailer::Base.deliveries.last.to).to eql [booking.email]
    end
  end
end
