class AddHealthInformationWhereMissing < ActiveRecord::Migration
  def change
    Horse.all.each do |horse|
      if horse.health_informations.count == 0
        horse.health_informations.create!
      end
    end
  end
end
