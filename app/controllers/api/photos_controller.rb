class API::PhotosController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    horse = @user.horses.find_by_id(params[:horse])
    respond_with horse.photos.all
  end

  def new
    @photo = @user.photo.new
  end

  def create
    new_photo_params = photo_params

    if photo_params[:image]
      photo = photo_params[:image]
      filename = photo_params[:filename]
      doc = split_base64(photo)

      File.open(Rails.root.join('tmp',filename).to_s,"w:binary") do |file|
        file.write(Base64::decode64(doc[:data]))
      end
      f = File.open(Rails.root.join('tmp',filename).to_s)
      new_photo_params[:image] = f
    end

    @image = Photo.new(new_photo_params.merge(horse_id: params[:photo][:horse_id]))
    if @image.save
      render json: @image, status: 201
    else
      render json: { errors: @image.errors.full_messages }, status: 422
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :filename, :horse_id)
  end
end
