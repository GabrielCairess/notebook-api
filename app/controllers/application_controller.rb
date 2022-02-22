class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate

  # AUTHENTICATE_USER_EXCEPT_CONTROLLERS = ['auths']
  # # before_action :ensure_json_request

  # # quando quer forçar a somente aceitar format json.
  # # def ensure_json_request
  # #   return if request.headers["Accept"] =~ /json/
  # #   render nothing: true, status: 406
  # # end

  # private 
  # def authenticate
  #   puts params
  #   unless AUTHENTICATE_USER_EXCEPT_CONTROLLERS.include?(params[:controller])
  #     authenticate_or_request_with_http_token do |token, options|
  #       # ActiveSupport::SecurityUtils.secure_compare(
  #       #   ::Digest::SHA256.hexdigest(token),
  #       #   ::Digest::SHA256.hexdigest(TOKEN)
  #       # )
  #       hmac_secret = 'kahsdkjas'
  #       JWT.decode(token, hmac_secret, 'HS256')
  #     end
  #   end
  # end
end
