# == Schema Information
#
# Table name: health_informations
#
#  id                 :integer          not null, primary key
#  last_dentist       :date
#  dentist_name       :string(255)
#  dentist_phone      :string(255)
#  dentist_interval   :integer
#  last_coggins       :date
#  last_deworming     :date
#  last_tetanus       :date
#  last_rabies        :date
#  last_vew           :date
#  last_botulism      :date
#  last_potomac       :date
#  last_strangles     :date
#  last_anthrax       :date
#  last_rhino_flu     :date
#  rhino_interval     :integer
#  last_west_nile     :date
#  west_nile_interval :integer
#  other_vacc         :text
#  health_comments    :text
#  created_at         :datetime
#  updated_at         :datetime
#

class HealthInformation < ActiveRecord::Base
end
