# == Schema Information
#
# Table name: horses
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  nick_name     :string(255)
#  sex           :string(255)
#  fertility     :string(255)
#  foaling_date  :datetime
#  color         :string(255)
#  date_of_birth :datetime
#  markings      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Horse < ActiveRecord::Base
end
