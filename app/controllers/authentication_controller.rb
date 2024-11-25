class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:register, :login]

  def register
    user = User.new(user_params)
    
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      
      # Include user details in the response
      render json: { 
        message: 'User created successfully',
        token: token,
        user: {
          id: user.id,
          yos: user.yos,
          age: user.age,
          gender: user.gender,
          qualification: user.qualification,
          role: user.role,
          manager: user.manager,
          username: user.username
        }
      }, status: :created
    else
      render json: { error: 'User creation failed', details: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    authenticated_user = user&.authenticate(params[:password])

    if authenticated_user
      token = JsonWebToken.encode(user_id: user.id)
      expires_at = JsonWebToken.decode(token)[:exp]

      # Return the token along with user details
      render json: { 
        token: token,
        expires_at: expires_at,
        user: {
          id: user.id,
          yos: user.yos,
          age: user.age,
          gender: user.gender,
          qualification: user.qualification,
          role: user.role,
          manager: user.manager,
          username: user.username
        }
      }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

    # GET /user_details
    def user_details
      # Decode the token from the Authorization header
      authorization_header = request.headers['Authorization']
      token = authorization_header.split(' ').last if authorization_header
      decoded_token = JsonWebToken.decode(token)
  
      # Find the user by the ID stored in the JWT
      user = User.find(decoded_token[:user_id])
  
      # Return user details in the response
    
      render json: { 
        id: user.id,
        yos: user.yos,
        age: user.age,
        gender: user.gender,
        qualification: user.qualification,
        role: user.role,
        manager: user.manager,
        username: user.username
      }, status: :ok
    rescue JWT::DecodeError
      render json: { error: 'Invalid or expired token' }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role, :manager, :age, :gender, :yos, :qualification)
  end
end