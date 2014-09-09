# == Schema Information
#
# Table name: horses
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  nick_name           :string(255)
#  sex                 :string(255)
#  fertility           :string(255)
#  foaling_date        :datetime
#  color               :string(255)
#  date_of_birth       :datetime
#  markings            :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  avatar              :string(255)
#  breed               :string(255)
#  registration_number :string(255)
#  org_numbers         :string(255)
#  emergencies         :text
#  comments            :text
#

class Horse < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  has_many :photos
  has_many :documents
end
