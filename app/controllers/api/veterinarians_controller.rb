class API::VeterinariansController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    respond_with @user.veterinarians.all
  end

  def new
    @vet = @user.veterinarian.new
  end

  def create
    api_key = request.headers['X-Auth-Token']
    user = User.where(authentication_token: api_key).first if api_key
    @vet = Veterinarian.new(vet_params.merge(user_id: user.id))
    if @vet.save!
      render json: @vet, status: 201
    else
      respond_with text: 'Failed'
    end
  end

  def show
    respond_with Veterinarian.find(params[:id])
  end

  def update
    vet = @user.veterinarians.find_by_id(params[:id])
    if vet.update_attributes(vet_params)
      render json: vet.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  def destroy
    @user.veterinarians.find_by_id(params[:id]).destroy
    head :no_content
  end

  private

  def vet_params
    params.require(:veterinarian).permit(:name, :phone, :user_id)
  end

end
