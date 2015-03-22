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

class Booking < ActiveRecord::Base
  include ActiveModel::Validations
  validates :email, presence: true
  validates :start_date, presence: true 
  validates :end_date, presence: true

  has_many :booking_calendars, dependent: :destroy
  
  validate :has_dates

  def dates
    (self.start_date..self.end_date).to_a
  end

  private

  def has_dates
    unless self.dates.present?
      errors.add(:end_date, 'End date must be a valid date')
    end
  end
end
