class HorseSerializer < ActiveModel::Serializer
  attributes :id, :name, :nick_name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings
end
