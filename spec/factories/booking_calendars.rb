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

FactoryGirl.define do
  factory :booking_calendar do
    starts_at DateTime.now.beginning_of_day
    booking
  end
end
