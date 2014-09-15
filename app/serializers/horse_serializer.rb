class HorseSerializer < ActiveModel::Serializer
  attributes :id, :nick_name, :name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :user_id, :avatar,
            :breed, :registration_number, :org_numbers, :emergencies, :comments
end
