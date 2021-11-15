class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      invalid_login
    end
  end

  private

  def invalid_login
    render json: { message: 'You have entered an invalid email or password' }
  end
end
