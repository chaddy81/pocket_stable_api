class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :start_time, :end_time, :content, :user_id
end
