class API::UsersController < ApplicationController
  skip_before_filter :authenticate!
  respond_to :json

  def index
    api_key = request.headers['X-Auth-Token']
    @user = User.where(authentication_token: api_key).first if api_key
    respond_with @user
  end

  def show
    api_key = request.headers['X-Auth-Token']
    @user = User.where(authentication_token: api_key).first if api_key
    respond_with @user
  end

  def update
    user = User.find(params[:id])
    current_password = params[:user][:current_password]
    new_password = params[:user][:password]
    confirm_password = params[:user][:password_confirmation]
    if user.valid_password?(current_password)
      if new_password == confirm_password
        user.update_with_password(user_params)
        sign_in user, :bypass => true
        respond_with user, status: :accepted, text: "Password updated successfully"
      else
        respond_with user, status: :expectation_failed, text: "Passwords do not match"
      end
    else
      respond_with user, status: :unauthorized, text: "Password is invalid"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end