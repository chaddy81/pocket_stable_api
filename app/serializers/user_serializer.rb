class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_one :payment

end
