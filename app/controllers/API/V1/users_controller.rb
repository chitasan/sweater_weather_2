class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user.update(api_key: SecureRandom.uuid)
      render status: 201,
      json: {
        api_key: user.api_key
      }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
 end