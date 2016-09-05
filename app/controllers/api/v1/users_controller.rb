class API::V1::UsersController < ActionController::API

  def index
    users = User.all
    render json: users
  end
end
