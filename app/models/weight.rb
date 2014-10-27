# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Weight < ActiveRecord::Base
  belongs_to :horse
end
