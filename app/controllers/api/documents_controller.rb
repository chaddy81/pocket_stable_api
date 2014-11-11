class API::DocumentsController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    if params[:horse_id]
      @documents = @user.documents.where('horses ILIKE ?', "%#{params[:horse_id]}%")
      respond_with @documents
    else
      respond_with @user.documents.all
    end
  end

  def new
    @document = @user.document.new
  end

  def create
    api_key = request.headers['X-Auth-Token']
    user = User.where(authentication_token: api_key).first if api_key

    new_document_params = document_params

    if document_params[:file]
      file = document_params[:file]
      filename = document_params[:filename]
      doc = split_base64(file)

      File.open(Rails.root.join('tmp',filename).to_s,"w:binary") do |file|
        file.write(Base64::decode64(doc[:data]))
      end
      f = File.open(Rails.root.join('tmp',filename).to_s)
      new_document_params[:file] = f
    end

    @document = Document.new(new_document_params.merge(user_id: user.id))
    if @document.save
      render json: @document, status: 201
    else
      render json: { errors: @document.errors.full_messages }, status: 422
    end
  end

  def show
    respond_with Document.find(params[:id])
  end

  def destroy
    Document.find(params[:id]).destroy
    head :no_content
  end

  private

  def document_params
    params.require(:document).permit(:name, :file, :filename, :user_id, :horses)
  end
end
