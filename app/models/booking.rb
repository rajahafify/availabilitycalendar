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
end
