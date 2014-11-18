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

class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  validates_presence_of :image
end
