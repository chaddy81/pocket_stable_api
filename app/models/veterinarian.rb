# == Schema Information
#
# Table name: veterinarians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  horse_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Veterinarian < ActiveRecord::Base
end
