class HorseSerializer < ActiveModel::Serializer
  attributes :id, :nick_name, :name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :user_id, :avatar_thumb_url,
            :avatar_profile_url, :breed, :registration_number, :org_numbers, :emergencies, :comments

  def avatar_thumb_url
    "https://s3.amazonaws.com/pocket-stable/#{object.avatar.thumb.path}"
  end

  def avatar_profile_url
    "https://s3.amazonaws.com/pocket-stable/#{object.avatar.path}"
  end

end
