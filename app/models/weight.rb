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

class Weight < ActiveRecord::Base
  belongs_to :horse
end
