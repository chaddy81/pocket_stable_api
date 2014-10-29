class AddStableInformationWhereMissing < ActiveRecord::Migration
  def change
    Horse.all.each do |horse|
      if horse.stable_informations.count == 0
        horse.stable_informations.create!
      end
    end
  end
end
