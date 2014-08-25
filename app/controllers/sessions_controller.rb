class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate!

  def create
    respond_to do |format|
      format.json do
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email,
          user_name: self.resource.name
        }
        render json: data, status: 201
      end
    end
  end

end
