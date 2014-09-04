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
    puts "Got here"
    @horse = Horse.new(horse_params)
    if @horse.save!
      respond_with @horse
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
    params.require(:horse).permit(:name, :nick_name, :sex, :fertility, :foaling_date, :color, :date_of_birth, :markings, :avatar, :breed, :registration_number, :org_numbers, :emergencies, :comments)
  end

end
