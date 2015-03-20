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

  it { respond_to :email }
  it { respond_to :name }
  it { respond_to :contact_no }
  it { respond_to :start_date }
  it { respond_to :end_date }
  it { be_valid }
end
