class API::StableInformationController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def default_serializer_options
    {root: 'stable-information'}
  end

  def index
    horse = Horse.find(params[:id])
    respond_with horse.stable_informations
  end

  def show
    horse = Horse.find(params[:id])
    if horse.stable_informations.any?
      respond_with horse.stable_informations.first
    else
      head :no_content, status: 422
    end
  end

  def update
    puts params.to_yaml
    stable = StableInformation.find(params[:id])
    if stable.update_attributes(stable_params)
      render json: stable.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def stable_params
    params.require(:stable_information).permit(:farrier_interval, :farrier_name, :farrier_phone, :feed, :hay, :last_farrier, :supplements, :stableInformation, horses: [])
  end
end
