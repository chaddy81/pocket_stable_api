# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  date       :date
#  start_time :time
#  end_time   :time
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Note, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
