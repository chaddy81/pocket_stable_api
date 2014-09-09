# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  filename   :string(255)
#  horse_id   :integer
#

require 'rails_helper'

RSpec.describe Photo, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
