# == Schema Information
#
# Table name: stable_informations
#
#  id               :integer          not null, primary key
#  created_at       :datetime
#  updated_at       :datetime
#  last_farrier     :datetime
#  farrier_name     :string(255)
#  farrier_phone    :string(255)
#  farrier_interval :integer
#  hay              :string(255)
#  feed             :string(255)
#  supplements      :text
#  horse_id         :integer
#

require 'rails_helper'

RSpec.describe StableInformation, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
