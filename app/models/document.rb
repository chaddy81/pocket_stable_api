# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  filename   :string(255)
#  horse_id   :integer
#

class Document < ActiveRecord::Base
  mount_uploader :filename, DocumentUploader
end
