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

class BookingCalendar < ActiveRecord::Base
  validates :starts_at, presence: true, uniqueness: true
  validates :booking_id, presence: true

  belongs_to :booking
end
