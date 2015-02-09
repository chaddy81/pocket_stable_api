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

class Payment < ActiveRecord::Base
  belongs_to :user

  # after_save :update_next_charge_date

  private

  # def update_next_charge_date
  #   if self.charge_interval == 'monthly'
  #     self.update_columns(next_charge_date: Date.today + 1.month)
  #   elsif self.charge_interval == 'yearly'
  #     self.update_columns(next_charge_date: Date.today + 1.year)
  #   end
  # end
end
