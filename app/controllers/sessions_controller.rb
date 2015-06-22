class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate!

  def create
    user = User.find_by_email(params[:user][:user_email])
    if user.nil?
      render json: { message: 'Invalid email or password' }, status: 401 and return
    end

    if user.valid_password?(params[:user][:password])
      data = {
        user_token: user.authentication_token,
        user_email: user.email,
        user_name: user.name,
        user_id: user.id
      }
      render json: data
    else
      render json: { message: 'Invalid email or password' }, status: 401
    end
    # respond_to do |format|
    #   format.json do
    #     self.resource = warden.authenticate!(auth_options)
    #     sign_in(resource_name, resource)
    #     data = {
    #       token: self.resource.authentication_token,
    #       user_email: self.resource.email,
    #       user_name: self.resource.name
    #     }
    #     render json: data, status: 201
    #   end
    # end
  end

end
