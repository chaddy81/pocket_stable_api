class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :filename, :horse_id
end
