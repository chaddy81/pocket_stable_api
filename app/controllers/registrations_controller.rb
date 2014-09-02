class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate!, only: :create
  respond_to :json
  def create
    puts "Params are: #{user_params.to_yaml}"
    user = User.new(user_params)
    puts user.name
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json => user.errors, :status=>422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end