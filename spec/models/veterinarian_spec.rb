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

require 'rails_helper'

RSpec.describe Veterinarian, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
