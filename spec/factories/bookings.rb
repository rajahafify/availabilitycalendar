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
    start_date Date.today
    end_date Date.today
  end
end
