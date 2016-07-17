class StoresController < ApplicationController
  before_action :store_lookup, only: [:show]

  def index
    stores = Store.all
    render json: stores
  end


  def show
    render json: @store
  end

  private

  def store_lookup
    begin
      @store = Store.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Wrong ID provided" }, status: 404
    end
  end
end
