class API::SearchController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    horses = @user.horses.where('name ILIKE ?', "%#{params[:q]}%")
    respond_with horses
  end

  private

  def search_params
    params.permit(:q)
  end

end
