class API::DocumentsController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    respond_with @user.documents.all
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
    if @document.save!
      render json: @document, status: 201
    else
      respond_with text: 'Failed'
    end
  end

  def show
    respond_with Document.find(params[:id])
  end

  def destroy
    Document.find(params[:id]).destroy
    render nothing: true, status: :ok
  end

  private

  def document_params
    params.require(:document).permit(:name, :file, :filename, :tags, :user_id)
  end
end
