# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  name       :string
#  contact_no :string
#  start_date :datetime         not null
#  end_date   :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking) { build :booking }

  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :contact_no }
  it { is_expected.to respond_to :start_date }
  it { is_expected.to respond_to :end_date }
  it { is_expected.to be_valid }

  describe "validations" do
    it "requires email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "requires start_date" do
      subject.start_date = nil
      expect(subject).not_to be_valid
    end

    it "requires end_date" do
      subject.end_date = nil
      expect(subject).not_to be_valid
    end
  end

  describe "associations" do
    it "should has many booking calender" do
      subject.save
      booking_calendar = create :booking_calendar
      subject.booking_calendars << booking_calendar
      expect(subject.booking_calendars.to_a).to be_include booking_calendar
    end
  end
end
