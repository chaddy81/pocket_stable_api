# == Schema Information
#
# Table name: payments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  card_last4       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  next_charge_date :date
#  cost             :decimal(8, 2)
#  charge_interval  :string           default("yearly")
#  total_horses     :integer          default("1")
#  stripe_token     :string
#

require 'rails_helper'

RSpec.describe Payment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
