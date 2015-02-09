# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  filename   :string(255)
#  horse_id   :integer
#  image      :string(255)
#

class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  belongs_to :horse

  validates_presence_of :image
end
