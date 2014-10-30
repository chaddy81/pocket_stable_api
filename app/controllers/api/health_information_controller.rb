class API::HealthInformationController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def default_serializer_options
    {root: 'health-information'}
  end

  def show
    horse = @user.horses.find_by_id(params[:id])
    if horse.health_informations.any?
      respond_with horse.health_informations.first
    else
      head :no_content, status: 422
    end
  end

  def update
    health = HealthInformation.find(params[:id])
    if health.update_attributes(health_params)
      render json: health.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def health_params
    params.require(:health_information).permit(:last_dentist, :dentist_name, :dentist_phone, :dentist_interval, :last_coggins, :last_deworming, :last_tetanus, :last_rabies, :last_vew, :last_botulism, :last_potomac, :last_strangles, :last_anthrax, :last_rhino_flu, :rhino_interval, :last_west_nile, :west_nile_interval, :other_vacc, :health_comments, horses: [])
  end

end
