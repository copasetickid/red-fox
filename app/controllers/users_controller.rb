class UsersController < ApplicationController
  before_action :user_lookup, only: [:show]

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  private

  def user_lookup
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Wrong ID provided" }, status: 404
    end
  end
end
