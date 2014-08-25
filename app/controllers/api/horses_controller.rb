class API::HorsesController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    respond_with @user.horses.all
  end

  def show
    respond_with Horse.find(params[:id])
  end

end
