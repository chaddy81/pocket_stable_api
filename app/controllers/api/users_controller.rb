class API::UsersController < ApplicationController
  skip_before_filter :authenticate!, only: [:forgot_password, :reset_password]
  respond_to :json

  def index
    respond_with @user
  end

  def show
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
        respond_with user, status: :accepted
      else
        respond_with user, status: :expectation_failed, text: "Passwords do not match"
      end
    else
      respond_with user, status: :unauthorized, text: "Password is invalid"
    end
  end

  def forgot_password
    user = User.find_by_email(params[:email])
    # if params[:email].nil?
    #   render json: 'Please enter an email', status: 422
    # elsif user.blank?
    #   render json: 'User not found', status: 422
    # else

    user.send_reset_password_instructions
    render json: 'Reset instructions have been sent', status: :ok
    # end
  end

  def reset_password
    user = User.where(reset_password_token: params[:reset_token]).first
    unless user.nil?
      if params[:password].nil? || params[:password_confirmation].nil?
        render json: 'Password and/or Confirmation cannot be blank', status: 422
      elsif params[:password] == params[:password_confirmation]
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
        user.save
        head :no_content, status: 201
      else
        render json: 'Please ensure Password and Confirmation match', status: 422
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
