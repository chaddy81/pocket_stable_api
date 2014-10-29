# == Schema Information
#
# Table name: stable_informations
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  last_ferrier     :datetime
#  ferrier_name     :string(255)
#  farrier_phone    :string(255)
#  farrier_interval :integer
#  hay              :string(255)
#  feed             :string(255)
#  supplements      :text
#  horse_id         :integer
#

class StableInformation < ActiveRecord::Base
  belongs_to :horse
end
