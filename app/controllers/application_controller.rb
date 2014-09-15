class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_filter :authenticate!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
  end

  def split_base64(uri_str)
    if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
      return {
        type:      $1, # "image/png"
        encoder:   $2, # "base64"
        data:      $3, # data string
        extension: $1.split('/')[1] # "png"
        }
    end
  end

  private

    def authenticate!
      api_key = request.headers['X-Auth-Token']
      @user = User.where(authentication_token: api_key).first if api_key

      unless @user
        render status: :unauthorized, text: '401 Access Denied'
      end
    end

end
