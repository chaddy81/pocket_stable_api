class API::NotesController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def index
    respond_with @user.notes.all
  end

  def new
    @note = @user.note.new
  end

  def create
    api_key = request.headers['X-Auth-Token']
    user = User.where(authentication_token: api_key).first if api_key

    new_note_params = note_params
    new_note_params[:date] = note_params[:date].to_date

    @note = Note.new(new_note_params.merge(user_id: user.id))
    if @note.save!
      render json: @note, status: 201
    else
      respond_with text: 'Failed'
    end
  end

  def show
    respond_with Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    new_note_params = note_params
    new_note_params[:date] = note_params[:date].to_date
    # new_note_params[:date_of_birth] = Date.strptime(new_note_params[:date_of_birth], '%m/%d/%Y')
    if note.update_attributes(new_note_params)
      render json: note.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :date, :start_time, :end_time, :content, :user_id)
  end
end
