# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  file       :string(255)
#  user_id    :integer
#  name       :string(255)
#  horses     :string(255)
#  filename   :text
#

require 'rails_helper'

RSpec.describe Document, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
