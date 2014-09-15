# == Schema Information
#
# Table name: veterinarians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Veterinarian < ActiveRecord::Base
  belongs_to :user
end
