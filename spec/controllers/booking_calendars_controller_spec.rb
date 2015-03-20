require 'rails_helper'

RSpec.describe BookingCalendarsController, type: :controller do

  describe "#GET index" do
    it "should be sucess" do
      get :index
      expect(response).to be_success
    end
    
    it "should have correct variable" do
      get :index
      expect(assigns[:booking_calendars]).to eql BookingCalendar.all.to_a
    end
  end
end
