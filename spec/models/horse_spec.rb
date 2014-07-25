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

require 'rails_helper'

RSpec.describe Horse, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
