class StableInformationSerializer < ActiveModel::Serializer
  attributes :id, :last_farrier, :farrier_name, :farrier_phone, :farrier_interval, :hay, :feed, :supplements, :horse_id
end
