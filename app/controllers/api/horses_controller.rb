class API::HorsesController < ApplicationController

  respond_to :json

  def index
    respond_with Horse.all
  end

end
