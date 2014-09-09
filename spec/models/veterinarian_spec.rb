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

require 'rails_helper'

RSpec.describe Veterinarian, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
