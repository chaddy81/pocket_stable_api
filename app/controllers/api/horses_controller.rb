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
    api_key = request.headers['X-Auth-Token']
    user = User.where(authentication_token: api_key).first if api_key

    new_horse_params = horse_params

    if horse_params[:avatar]
      avatar = horse_params[:avatar]
      avatarData = split_base64(avatar)[:data]
      puts avatarData
      avatarBinary = Base64.decode64(avatarData)
      puts avatarBinary
      new_horse_params[:avatar] = avatarBinary
    end

    @horse = Horse.new(new_horse_params.merge(user_id: user.id))
    if @horse.save!
      render json: @horse, status: 201
    else
      respond_with text: 'Failed'
    end
  end

  def show
    respond_with Horse.find(params[:id])
  end

  def update
    puts horse_params
    horse = Horse.find(params[:id])
    new_horse_params = horse_params
    new_horse_params[:foaling_date] = Date.strptime(new_horse_params[:foaling_date], '%m/%d/%Y')
    new_horse_params[:date_of_birth] = Date.strptime(new_horse_params[:date_of_birth], '%m/%d/%Y')
    if horse.update_attributes(new_horse_params)
      render json: horse.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :nick_name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :avatar, :breed, :registration_number, :org_numbers, :emergencies, :comments, :user_id)
  end

end
