class API::WeightsController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    horse = Horse.find(params[:horse_id])
    respond_with horse.weights
  end

  def new
    @weight = @user.horse.weight.new
  end

  def create
    api_key = request.headers['X-Auth-Token']
    user = User.where(authentication_token: api_key).first if api_key
    @weight = Weight.new(weight_params.merge(user_id: user.id))
    if @weight.save!
      render json: @weight, status: 201
    else
      respond_with text: 'Failed'
    end
  end

  def show
    # @weights =  Weight.where(horse_id: params[:id])
    respond_with Weight.all
  end

  private

  def weight_params
    params.require(:weight).permit(:weight, :horse_id)
  end

end
