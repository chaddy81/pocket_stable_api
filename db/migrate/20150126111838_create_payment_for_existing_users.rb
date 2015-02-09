class CreatePaymentForExistingUsers < ActiveRecord::Migration
  def change
    User.all.each do |user|
      Payment.where(user_id: user.id).first_or_create!
    end
  end
end
