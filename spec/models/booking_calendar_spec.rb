# == Schema Information
#
# Table name: booking_calendars
#
#  id         :integer          not null, primary key
#  starts_at  :datetime
#  booking_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BookingCalendar, type: :model do
  subject(:booking_calendar) { build :booking_calendar }

  it { is_expected.to respond_to :starts_at }
  it { is_expected.to respond_to :booking_id } 
  it { is_expected.to be_valid }

  describe "validations" do
    it "requires starts_at" do
      subject.starts_at = nil
      expect(subject).not_to be_valid
    end

    it "requires unique starts_at" do
      booking_calendar = create :booking_calendar
      subject.starts_at = booking_calendar.starts_at
      expect(subject).not_to be_valid
    end

    it "requires booking_id" do
      subject.booking_id = nil
      expect(subject).not_to be_valid
    end
  end

  describe "associations" do
    it "should belongs to booking" do
      subject.save
      booking = create :booking
      subject.booking_id = booking.id
      expect(subject.booking).to eql booking
    end
  end

  describe "BookingCalendar#unavailable_dates" do
    it "should return array of unavailable_dates" do
      booking_calendar = create :booking_calendar, starts_at: Date.today
      expect(BookingCalendar.unavailable_dates([Date.today])).to eql [Date.today]
    end
  end
end
