# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  file       :string(255)
#  user_id    :integer
#

class Document < ActiveRecord::Base
  mount_uploader :file, DocumentUploader

  belongs_to :user
end
