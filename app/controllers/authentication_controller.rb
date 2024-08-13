class AuthenticationController < ApplicationController
    skip_before_action :authenticate
 
    def login
      user = User.find_by(username: params[:username])
      authenticated_user = user&.authenticate(params[:password])
   
      if authenticated_user
        token = JsonWebToken.encode(user_id: user.id)
        expires_at = JsonWebToken.decode(token)[:exp]
   
        render json: { token:, expires_at: }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end
end
