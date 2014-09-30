class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :file, :tags, :filename

  def filename
    filename = object.file.url.split('/').reverse
    return filename[0]
  end
end
