# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  weight     :integer
#  horse_id   :integer
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Weight, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
