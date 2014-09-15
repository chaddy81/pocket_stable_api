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

class Note < ActiveRecord::Base
  belongs_to :user
end
