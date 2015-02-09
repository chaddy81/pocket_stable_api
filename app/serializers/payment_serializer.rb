class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :cost, :card_last4, :total_horses, :charge_interval, :temp_cost
end
