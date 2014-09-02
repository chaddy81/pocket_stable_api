class Document < ActiveRecord::Base
  mount_uploader :filename, DocumentUploader
end
