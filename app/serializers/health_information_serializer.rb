class HealthInformationSerializer < ActiveModel::Serializer
  attributes :id, :last_dentist, :dentist_name, :dentist_phone, :dentist_interval, :last_coggins, :last_deworming, :last_tetanus,
        :last_rabies, :last_vew, :last_botulism, :last_potomac, :last_strangles, :last_anthrax, :last_rhino_flu, :rhino_interval,
        :last_west_nile, :west_nile_interval, :other_vacc, :health_comments
end
