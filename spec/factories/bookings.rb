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

FactoryGirl.define do
  factory :booking do
    email "email@example.com"
    name "MyString"
    contact_no "MyString"
    start_date DateTime.now.beginning_of_day
    end_date 3.days.from_now.end_of_day
  end
end
