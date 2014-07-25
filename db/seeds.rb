# == Schema Information
#
# Table name: horses
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  nick_name     :string(255)
#  sex           :string(255)
#  fertility     :string(255)
#  foaling_date  :datetime
#  color         :string(255)
#  date_of_birth :datetime
#  markings      :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'faker'

COLORS = ['black', 'white', 'paint']

def random_date
  Date.today - rand(1..10).years
end

def male_or_female?(i)
  i % 2 == 0 ? 'male':'female'
end

10.times do |i|
  Horse.create(
    name: Faker::Name.name,
    nick_name: Faker::Name.name,
    sex: male_or_female?(i),
    fertility: Faker::Lorem.words.join(" "),
    foaling_date: random_date,
    color: COLORS.sample,
    date_of_birth: random_date,
    markings: Faker::Lorem.sentence,
  )
end
