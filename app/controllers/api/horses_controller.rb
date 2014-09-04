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
    @horse = Horse.new(horse_params.merge(user_id: user.id))
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
    @horse = Horse.find(params[:id])
    if @horse.update_attributes(horse_params)
      render json: @horse, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :nick_name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :avatar, :breed, :registration_number, :org_numbers, :emergencies, :comments, :user_id)
  end

end
