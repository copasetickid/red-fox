class API::V1::UsersController < ActionController::API
  before_action :store_lookup, only: [:show]

  def index
    users = User.all
    render json: users
  end
end
