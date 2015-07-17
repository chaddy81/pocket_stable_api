require 'base64'

class API::HorsesController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    respond_with @user.horses.all
  end

  def new
    @horse = @user.horse.new
  end

  def create
    if @user.horses.count < @user.payment.total_horses
      new_horse_params = horse_params

      new_horse_params[:foaling_date] = Date.parse(new_horse_params[:foaling_date]) if new_horse_params[:foaling_date]
      new_horse_params[:date_of_birth] = Date.parse(new_horse_params[:date_of_birth]) if new_horse_params[:date_of_birth]

      if horse_params[:avatar]
        avatar = horse_params[:avatar]
        image = split_base64(avatar)

        File.open(Rails.root.join('tmp','picture.' + image[:extension]).to_s,"w:binary") do |file|
          file.write(Base64::decode64(image[:data]))
        end
        f = File.open(Rails.root.join('tmp','picture.' + image[:extension]).to_s)
        new_horse_params[:avatar] = f
      end

      horse = @user.horses.new(new_horse_params)

      if horse.save
        horse.stable_informations.create!
        horse.health_informations.create!
        render json: horse, status: 201
      else
        render json: { errors: horse.errors.full_messages }, status: 422
      end
    else
      render json: { errors: "You must upgrade to add more horses" }, status: 422
    end
  end

  def show
    respond_with @user.horses.find_by_id(params[:id])
  end

  def destroy
    Horse.find(params[:id]).destroy
    head :no_content
  end

  def update
    puts horse_params
    horse = Horse.find(params[:id])
    new_horse_params = horse_params
    new_horse_params[:foaling_date] = Date.parse(new_horse_params[:foaling_date]) if new_horse_params[:foaling_date]
    new_horse_params[:date_of_birth] = Date.parse(new_horse_params[:date_of_birth]) if new_horse_params[:date_of_birth]

    if horse_params[:avatar]
      avatar = horse_params[:avatar]
      image = split_base64(avatar)

      File.open(Rails.root.join('tmp','picture.' + image[:extension]).to_s,"w:binary") do |file|
        file.write(Base64::decode64(image[:data]))
      end
      f = File.open(Rails.root.join('tmp','picture.' + image[:extension]).to_s)
      new_horse_params[:avatar] = f
    end

    if horse.update_attributes(new_horse_params)
      render json: horse.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def horse_params
    params.fetch(:horse, {}).permit(:name, :nick_name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :avatar, :breed, :registration_number, :org_numbers, :emergencies, :emergencies_phone, :comments, :user_id)
  end

end
